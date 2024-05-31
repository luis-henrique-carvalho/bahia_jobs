// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import "jquery";
import 'admin-lte';
import "select2";


document.addEventListener("turbo:load", () => {
    // Inicializar todos os selects com a classe .select2
    $('.select2').select2();
});
