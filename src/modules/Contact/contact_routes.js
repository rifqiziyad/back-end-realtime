const express = require('express')
const Route = express.Router()
const {
  createContact,
  getContactById,
  getAllContactForInviteFriend,
  getAllContactForContact
} = require('./contact_contorller')

Route.post('/', createContact)
Route.get('/', getAllContactForInviteFriend)
Route.get('/all-contact', getAllContactForContact)
Route.get('/:id', getContactById)

module.exports = Route
