const helper = require('../../helpers/wrapper')
const roomModel = require('./room_model')

module.exports = {
  createRoomChat: async (req, res) => {
    try {
      const { userId, friendId } = req.body
      const roomChat = parseInt(Math.random() * 100000)
      const setData1 = {
        room_chat: roomChat,
        user_id: userId,
        friend_id: friendId
      }
      const setData2 = {
        room_chat: roomChat,
        user_id: friendId,
        friend_id: userId
      }
      const result1 = await roomModel.createData(setData1)
      const result2 = await roomModel.createData(setData2)
      return helper.response(res, 200, 'Succes Create Data Contact', [
        result1,
        result2
      ])
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getDataRoomChat: async (req, res) => {
    try {
      const { id } = req.params
      let { search } = req.query
      if (search === undefined) search = ''
      const result = await roomModel.getDataRoomChat(id, search)
      return helper.response(res, 200, 'Succes Get Data Room Chat', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
