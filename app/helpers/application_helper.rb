module ApplicationHelper
  include Pagy::Frontend

  def dropzone_controller_div(&block)
    content_for :head_link do
      tag :link, rel: 'stylesheet', href: 'https://unpkg.com/dropzone@5/dist/min/dropzone.min.css', type: 'text/css'
    end

    data = {
      controller: 'dropzone',
      'dropzone-max-file-size' => '8',
      'dropzone-max-files' => '10',
      'dropzone-accepted-files' => 'image/jpeg,image/jpg,image/png,image/gif',
      'dropzone-dict-file-too-big' => 'Váš obrázok ma veľkosť {{filesize}} ale povolené sú len obrázky do veľkosti {{maxFilesize}} MB',
      'dropzone-dict-invalid-file-type' => 'Nesprávny formát súboru. Iba obrazky .jpg, .png alebo .gif su povolene'
    }

    content_tag(:div, class: 'dropzone dropzone-default dz-clickable', data:, &block)
  end

  def bootstrap_class_for_flash(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def toast
    turbo_stream.prepend('toast', partial: 'shared/toast')
  end
end
