# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin 'jquery', to: 'https://code.jquery.com/jquery-3.7.0.min.js'
pin 'admin-lte', to: 'admin-lte.js'
pin 'select2', to: 'https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js'

# Use direct uploads for Active Storage (remember to import "@rails/activestorage" in your application.js)
pin '@rails/activestorage', to: 'activestorage.esm.js'
pin 'dropzone', to: 'https://ga.jspm.io/npm:dropzone@6.0.0-beta.2/dist/dropzone.mjs'
pin 'just-extend', to: 'https://ga.jspm.io/npm:just-extend@5.1.1/index.esm.js'
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.9
