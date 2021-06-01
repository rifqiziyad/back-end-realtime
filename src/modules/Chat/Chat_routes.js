const express = require('express')
const Route = express.Router()

const { createChat, getChat, deleteChat } = require('./Chat_controller')

Route.post('/', createChat)
Route.get('/', getChat)
Route.delete('/:id', deleteChat)

module.exports = Route
