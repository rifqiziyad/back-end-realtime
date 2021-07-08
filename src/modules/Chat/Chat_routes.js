const express = require('express')
const Route = express.Router()
const { authentication } = require('../../middleware/auth')

const { createChat, getChat, deleteChat } = require('./Chat_controller')

Route.post('/', authentication, createChat)
Route.get('/', authentication, getChat)
Route.delete('/:id', authentication, deleteChat)

module.exports = Route
