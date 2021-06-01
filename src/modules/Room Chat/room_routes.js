const express = require('express')
const Route = express.Router()
const { createRoomChat, getDataRoomChat } = require('./room_controller')

Route.get('/:id', getDataRoomChat)
Route.post('/', createRoomChat)

module.exports = Route
