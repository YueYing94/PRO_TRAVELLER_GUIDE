import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="edit-tour"
export default class extends Controller {
  static targets = ["form", "card"];
  connect() {
    this.csrfToken = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute("content");
  }

  update(event) {
    console.log("hi");
    event.preventDefault();
    const url = this.formTarget.action;
    fetch(url, {
      method: "PATCH",
      headers: { Accept: "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.cardTarget.outerHTML = data.inserted_item;
        } else {
          this.formTarget.outerHTML = data.form;
        }
        const body = document.querySelector("body");
        body.classList.remove("modal-open");
        body.style = "";
      });
  }
}
