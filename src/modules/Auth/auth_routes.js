const express = require('express')
const Route = express.Router()
const { register, login, userVerification } = require('./auth_controller')

Route.post('/register', register)
Route.post('/login', login)
Route.post('/verif/:id', userVerification)

module.exports = Route
