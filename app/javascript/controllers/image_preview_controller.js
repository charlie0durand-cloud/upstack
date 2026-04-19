import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["canvas", "source", "picture"];

  show() {
    const reader = new FileReader();

    reader.onload = function () {
      this.canvasTarget.removeAttribute("hidden");

      this.canvasTarget.src = reader.result;

      this.pictureTarget.style.visibility = "hidden";
    }.bind(this)

    reader.readAsDataURL(this.sourceTarget.files[0]);
  }
}
