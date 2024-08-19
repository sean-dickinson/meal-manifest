import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dismissible"
export default class extends Controller {
  connect() {
  }

    dismiss() {
        this.element.remove()
    }
}
