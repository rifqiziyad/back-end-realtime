const express = require('express')
const Route = express.Router()
const {
  createContact,
  getContactById,
  getAllContact
} = require('./contact_contorller')

Route.post('/', createContact)
Route.get('/', getAllContact)
Route.get('/:id', getContactById)

module.exports = Route
