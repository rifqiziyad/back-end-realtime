const helper = require('../../helpers/wrapper')
const contactModel = require('./contact_model')

module.exports = {
  createContact: async (req, res) => {
    try {
      const { userId, friendId } = req.body
      const setData1 = {
        user_id: userId,
        friend_id: friendId
      }
      const setData2 = {
        user_id: friendId,
        friend_id: userId
      }
      const result1 = await contactModel.createData(setData1)
      const result2 = await contactModel.createData(setData2)
      return helper.response(res, 200, 'Succes Create Data Contact', [
        result1,
        result2
      ])
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getContactById: async (req, res) => {
    try {
      const { id } = req.params
      const result = await contactModel.getDataById(id)
      if (result.length > 0) {
        return helper.response(res, 200, `Succes Get Data By Id: ${id}`, result)
      } else {
        return helper.response(res, 200, `Data By Id: ${id} Not Found`, null)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getAllContact: async (req, res) => {
    try {
      const result = await contactModel.getAllData()
      return helper.response(res, 200, 'Succes Get All Data Contact', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
