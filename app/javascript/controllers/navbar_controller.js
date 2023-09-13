import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["li"]

  updateNavbar() {
    if (window.scrollY <= window.innerHeight) {
      this.element.classList.add("navbar-transparent")
      this.liTarget.classList.add("link-color")
    } else {
      this.element.classList.remove("navbar-transparent")
    }
  };
}
