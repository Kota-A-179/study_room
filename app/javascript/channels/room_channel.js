import consumer from "channels/consumer"

let currentRoomId = null;
let currentSubscription = null;

document.addEventListener("turbo:load", function() {
  const roomId = document.getElementById("room-id").value;

  if (currentRoomId !== roomId) {
    if (currentSubscription) {
      currentSubscription.unsubscribe();
    }

    currentRoomId = roomId;

    currentSubscription = consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
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
        const sidebar = document.querySelector('.sidebar');

        if (data.action == 'addUser') {
          // ユーザーのHTML要素を追加
          const userElement = document.getElementById(`user-${data.user_id}`);
          if (!userElement) {
          roomUsersWrap.insertAdjacentHTML('beforeend', data.user);
          }
        } else if (data.action == 'removeUser') {
          //ユーザーのHTML要素を削除
          const userElement = document.getElementById(`user-${data.user_id}`);
          if (userElement) {
            userElement.remove();
          }
        } else if (data.action == 'updateUser') {
          //ユーザーのHTML要素を更新
          const userElement = document.getElementById(`user-${data.user_id}`);
          if (userElement) {
            userElement.outerHTML = data.html;
          }
        } else if (data.action == 'removeRoom') {
          //ルームリンクのHTML要素を削除
          const roomElement = document.getElementById(`room-${data.room_id}`);
          if (roomElement) {
            roomElement.remove();
          }
        }
      }
    });
  }
});