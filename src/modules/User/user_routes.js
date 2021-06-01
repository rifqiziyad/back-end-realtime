const express = require('express')
const Route = express.Router()

const uploadImage = require('../../middleware/uploads')
const {
  getDataById,
  getAllUserData,
  updateUserData,
  updateUserPasswrod
} = require('./user_controller')
const { authentication } = require('../../middleware/auth')

Route.get('/:id', authentication, getDataById)
Route.get('/', getAllUserData)
Route.patch('/:id', uploadImage, updateUserData)
Route.patch('/patch/:id', updateUserPasswrod)

module.exports = Route
