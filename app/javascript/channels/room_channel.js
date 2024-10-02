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
      const roomUsersWrap = document.querySelector('.room-users-wrap');

      if (data.action == 'add') {
        // 受け取ったデータを画面に追加
        roomUsersWrap.insertAdjacentHTML('beforeend', data.user);
      } else if (data.action == 'remove') {
        //ユーザーのHTML要素を削除
        const userElement = document.getElementById(`user-${data.user_id}`);
        if (userElement) {
          userElement.remove();
        }
      } else if (data.action == 'update') {
        //ユーザーのHTML要素を更新
        const userElement = document.getElementById(`user-${data.user_id}`);
        if (userElement) {
          userElement.outerHTML = data.html;
        }
      }
    }
  });
});