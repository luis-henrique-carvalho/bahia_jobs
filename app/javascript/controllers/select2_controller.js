// app/javascript/controllers/select2_controller.js
import { Controller } from "@hotwired/stimulus"
import "select2";

// Connects to data-controller="select2"
export default class extends Controller {
    connect() {
        $(document).ready(function () {
            $('.select2').select2();
        });
    }
}
