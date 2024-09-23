import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer";

// Connects to data-controller="room-user"
export default class extends Controller {
  static targets = ["usersList"];

  connect() {
    this.subscription = consumer.subscriptions.create("RoomUserChannel", {
      received: (data) => {
        this.usersListTarget.insertAdjacentHTML("beforeend", data.room_user);
      }
    });
  }
  disconnect() {
    if (this.subscription) {
      consumer.subscriptions.remove(this.subscription);
    }
  }
}
