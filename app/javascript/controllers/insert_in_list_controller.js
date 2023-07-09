import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "dom"];
  connect() {
    this.csrfToken = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute("content");
  }

  send(event) {
    event.preventDefault();
    const url = this.formTarget.action;
    console.log(url);
    fetch(url, {
      method: "POST",
      headers: { Accept: "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        if (data.inserted_item) {
          this.domTarget.innerHTML = data.inserted_item;
        } else {
          this.formTarget.outerHTML = data.form;
        }
        this.formTarget.reset();
        const body = document.querySelector("body");
        body.classList.remove("modal-open");
        body.style = "";
      });
  }
}
