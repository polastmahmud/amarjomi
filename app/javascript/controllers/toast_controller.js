import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
		setTimeout(() => {
			this.element.classList.add("hidden")
		}, 5000)
  }
}
