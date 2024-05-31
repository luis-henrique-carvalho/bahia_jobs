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
