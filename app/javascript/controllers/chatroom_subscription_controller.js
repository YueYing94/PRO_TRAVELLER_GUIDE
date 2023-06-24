import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"];
  static values = { id: Number };

  connect() {
    createConsumer().subscriptions.create({
      channel: "ChatroomChannel",
      chatroomId: this.idValue,
    });
  }
}
