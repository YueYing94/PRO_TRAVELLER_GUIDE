import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages", "last", "input"];
  static values = { id: Number };

  connect() {
    console.log(this.lastTarget);
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.idValue },
      { received: (data) => this.#insertMessageAndScrollDown(data) }
    );
  }
  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data);

    const regex1 = /<strong>(.+)<\/strong>/;
    const found1 = data.match(regex1);
    const userName = found1[1];

    const regex2 = /<i>(.+)<\/i>/;
    const found2 = data.match(regex2);
    const time = found2[1];

    const regex3 = /<p>(.+)<\/p>/;
    const found3 = data.match(regex3);
    const text = found3[1];

    this.lastTarget.innerHTML = `<strong>${userName}: ${text.substring(
      0,
      8
    )}</strong> ${time}`;
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    this.clearInput();
  }

  clearInput() {
    const inputField = this.inputTarget;
    inputField.value = "";
  }
}
