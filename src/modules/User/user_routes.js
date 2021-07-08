const express = require('express')
const Route = express.Router()

const uploadImage = require('../../middleware/uploads')
const {
  getDataById,
  getAllUserData,
  updateUserData,
  updateUserPasswrod,
  updataImage
} = require('./user_controller')
const { authentication } = require('../../middleware/auth')

Route.get('/:id', authentication, getDataById)
Route.get('/', authentication, getAllUserData)
Route.patch('/:id', authentication, updateUserData)
Route.patch('/patch/:id', authentication, updateUserPasswrod)
Route.patch('/image/:id', authentication, uploadImage, updataImage)

module.exports = Route
