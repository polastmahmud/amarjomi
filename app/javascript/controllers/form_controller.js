import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["variant", "sizelabel", "sizeinput"];
  connect() {
    this.updateUnit();
  }
  updateUnit() {
    let unit = ""
    if (this.variantTarget.value == "Flat")
      unit = "Square feet"
    else
      unit = "Katha"
    this.sizelabelTarget.innerText = `Size (${unit})`;
    this.sizeinputTarget.placeholder = `Size (${unit})`;
  }
}
