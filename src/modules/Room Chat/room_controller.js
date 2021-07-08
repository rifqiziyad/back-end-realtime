const helper = require('../../helpers/wrapper')
const roomModel = require('./room_model')

module.exports = {
  createRoomChat: async (req, res) => {
    console.log(req.body)
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
