// app/javascript/controllers/dropzone_controller.js
import { Controller } from "@hotwired/stimulus"
import { DirectUpload } from "@rails/activestorage";
import { Dropzone } from "dropzone";


export default class extends Controller {
  static targets = ["input"];

  connect() {
    this.dropZone = this.createDropZone(this);
    this.hideFileInput();
    this.bindEvents();
    Dropzone.autoDiscover = false;
  }

  // Private
  hideFileInput() {
    this.inputTarget.disabled = true;
    this.inputTarget.style.display = "none";
  }

  bindEvents() {
    this.dropZone.on("addedfile", file => {
      setTimeout(() => {
        file.accepted && this.createDirectUploadController(this, file).start();
      }, 500);
    });

    this.dropZone.on("removedfile", file => {
      file.controller && this.removeElement(file.controller.hiddenInput);
    });

    this.dropZone.on("canceled", file => {
      file.controller && file.controller.xhr.abort();
    });
  }

  get headers() {
    return { "X-CSRF-Token": this.getMetaValue("csrf-token") };
  }

  get url() {
    return this.inputTarget.getAttribute("data-direct-upload-url");
  }

  get maxFiles() {
    return this.data.get("maxFiles") || 1;
  }

  get maxFileSize() {
    return this.data.get("maxFileSize") || 256;
  }

  get dictFileTooBig() {
    return this.data.get("dictFileTooBig") || "File sile is {{filesize}} but only files up to {{maxFilesize}} are allowed";
  }

  get dictInvalidFileType() {
    return this.data.get("dictInvalidFileType") || "Invalid file type";
  }

  get acceptedFiles() {
    return this.data.get("acceptedFiles");
  }

  get addRemoveLinks() {
    return this.data.get("addRemoveLinks") || true;
  }

  getMetaValue(name) {
    const element = this.findElement(document.head, `meta[name="${name}"]`);
    if (element) {
      return element.getAttribute("content");
    }
  }

  findElement(root, selector) {
    if (typeof root == "string") {
      selector = root;
      root = document;
    }
    return root.querySelector(selector);
  }

  removeElement(el) {
    if (el && el.parentNode) {
      el.parentNode.removeChild(el);
    }
  }

  createDirectUploadController(source, file) {
    return new DirectUploadController(source, file);
  }

  createDropZone(controller) {
    return new Dropzone(controller.element, {
      url: controller.url,
      headers: controller.headers,
      maxFiles: controller.maxFiles,
      maxFilesize: controller.maxFileSize,
      dictFileTooBig: controller.dictFileTooBig,
      dictInvalidFileType: controller.dictInvalidFileType,
      acceptedFiles: controller.acceptedFiles,
      autoQueue: false,
      previewTemplate: `
      <div class="card card-default p-4">
      <div id="actions" class="row">
        <div class="col-lg-6 d-flex align-items-center">
          <div class="fileupload-process w-100">
            <div class="dz-progress">
              <span class="dz-upload bg-primary" data-dz-uploadprogress=""></span>
            </div>
          </div>
        </div>
      </div>
      <div class="table table-striped files" id="previews">
        <div id="template" class="row mt-2 d-flex justify-content-between">
          <div class="d-flex flex-row col-auto">
            <div class="col-auto">
              <span class="preview"
                ><img src="data:," alt="" data-dz-thumbnail
              /></span>
            </div>
            <div class="col d-flex align-items-center">
              <p class="mb-0">
                <span class="lead" data-dz-name></span>
                (<span data-dz-size></span>)
              </p>
              <strong class="error text-danger" data-dz-errormessage></strong>
            </div>
          </div>

          <div class="col-auto d-flex align-items-cente" >
            <div class="btn-group">
              <button data-dz-remove class="btn btn-danger delete">
                <i class="fas fa-trash"></i>
                <span>Delete</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
          `,
    });
  }
}

class DirectUploadController {
  constructor(source, file) {
    this.directUpload = this.createDirectUpload(file, source.url, this);
    this.source = source;
    this.file = file;
  }

  start() {
    this.file.controller = this;
    this.hiddenInput = this.createHiddenInput();
    this.directUpload.create((error, attributes) => {
      if (error) {
        this.removeElement(this.hiddenInput);
        this.emitDropzoneError(error);
      } else {
        this.hiddenInput.value = attributes.signed_id;
        this.emitDropzoneSuccess();
      }
    });
  }

  createHiddenInput() {
    const input = document.createElement("input");
    input.type = "hidden";
    input.name = this.source.inputTarget.name;
    this.insertAfter(input, this.source.inputTarget);
    return input;
  }

  insertAfter(el, referenceNode) {
    return referenceNode.parentNode.insertBefore(el, referenceNode.nextSibling);
  }

  removeElement(el) {
    if (el && el.parentNode) {
      el.parentNode.removeChild(el);
    }
  }

  directUploadWillStoreFileWithXHR(xhr) {
    this.bindProgressEvent(xhr);
    this.emitDropzoneUploading();
  }

  bindProgressEvent(xhr) {
    this.xhr = xhr;
    this.xhr.upload.addEventListener("progress", event =>
      this.uploadRequestDidProgress(event)
    );
  }

  uploadRequestDidProgress(event) {
    const element = this.source.element;
    const progress = (event.loaded / event.total) * 100;
    this.findElement(
      this.file.previewTemplate,
      ".dz-upload"
    ).style.width = `${progress}%`;
  }

  findElement(root, selector) {
    if (typeof root == "string") {
      selector = root;
      root = document;
    }
    return root.querySelector(selector);
  }

  emitDropzoneUploading() {
    this.file.status = Dropzone.UPLOADING;
    this.source.dropZone.emit("processing", this.file);
  }

  emitDropzoneError(error) {
    this.file.status = Dropzone.ERROR;
    this.source.dropZone.emit("error", this.file, error);
    this.source.dropZone.emit("complete", this.file);
  }

  emitDropzoneSuccess() {
    this.file.status = Dropzone.SUCCESS;
    this.source.dropZone.emit("success", this.file);
    this.source.dropZone.emit("complete", this.file);
  }

  createDirectUpload(file, url, controller) {
    return new DirectUpload(file, url, controller);
  }
}
