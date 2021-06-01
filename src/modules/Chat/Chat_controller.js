const helper = require('../../helpers/wrapper')
const chatModel = require('./Chat_model')

module.exports = {
  createChat: async (req, res) => {
    try {
      const { roomChat, senderId, receiverId, messages } = req.body
      const setData = {
        room_chat: roomChat,
        sender_id: senderId,
        receiver_id: receiverId,
        message: messages
      }
      const result = await chatModel.createData(setData)
      return helper.response(res, 200, 'Success Create Chat Data', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getChat: async (req, res) => {
    try {
      const { roomChat } = req.query
      const result = await chatModel.getDataChat(roomChat)
      return helper.response(res, 200, 'Success Get Chat Data', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  deleteChat: async (req, res) => {
    console.log(req.params)
  }
}
