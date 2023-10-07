import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="popover"
export default class extends Controller {
  static targets = ["toggled"];

  initialize() {}

  toggle() {
    this.toggledTarget.hidden = !this.toggledTarget.hidden;
  }

  // popover() {
  //   document.startViewTransition(() => toggle());
  // }
}
