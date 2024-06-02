// app/javascript/controllers/select2_controller.js
import { Controller } from "@hotwired/stimulus"
import "select2";

// Connects to data-controller="select2"
export default class extends Controller {
    connect() {
        console.log('Select2 connected');
    }

    initialize() {
        $(this.element).select2();
    }

    disconnect() {
        $(this.element).select2('destroy');
    }
}
