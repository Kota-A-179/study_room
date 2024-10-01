import consumer from "channels/consumer"

document.addEventListener("DOMContentLoaded", function() {
  const roomId = document.getElementById("room-id").value;

  consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Connected to RoomChannel");
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
      console.log("Disconnected from RoomChannel");
    },

    received(data) {
      // 受け取ったデータを画面に追加
      const roomUsersWrap = document.querySelector('.room-users-wrap');
      roomUsersWrap.insertAdjacentHTML('beforeend', data.user);
    }
  });
});