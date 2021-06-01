const express = require('express')
const Route = express.Router()

const authRouter = require('../modules/Auth/auth_routes')
const contactRouter = require('../modules/Contact/contact_routes')
const userRouter = require('../modules/User/user_routes')
const roomChatRouter = require('../modules/Room Chat/room_routes')
const chatRouter = require('../modules/Chat/Chat_routes')

Route.use('/auth', authRouter)
Route.use('/contact', contactRouter)
Route.use('/user', userRouter)
Route.use('/room-chat', roomChatRouter)
Route.use('/chat', chatRouter)

module.exports = Route
