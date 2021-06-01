const helper = require('../../helpers/wrapper')
const roomModel = require('./room_model')

module.exports = {
  createRoomChat: async (req, res) => {
    console.log(req.body)
  },
  getDataRoomChat: async (req, res) => {
    try {
      const { id } = req.params
      const result = await roomModel.getDataRoomChat(id)
      return helper.response(res, 200, 'Succes Get Data Room Chat', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
