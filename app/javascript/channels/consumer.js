// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

import { createConsumer } from "@rails/actioncable"

const cableUrl = window.location.hostname === 'localhost'
  ? "ws://localhost:3000/cable"
  : "wss://study-room-rails7.onrender.com/cable"

export default createConsumer(cableUrl)
