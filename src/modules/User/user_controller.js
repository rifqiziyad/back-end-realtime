const helper = require('../../helpers/wrapper')
const userModel = require('./user_model')
const fs = require('fs')
const bcrypt = require('bcrypt')

module.exports = {
  getDataById: async (req, res) => {
    try {
      const { id } = req.params
      const result = await userModel.getDataById(id)
      if (result.length > 0) {
        return helper.response(res, 200, `Succes Get Data By Id: ${id}`, result)
      } else {
        return helper.response(res, 404, `Data By Id: ${id} Not Found`, null)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getAllUserData: async (req, res) => {
    try {
      const result = await userModel.getAllData()
      return helper.response(res, 200, 'Succes Get All Data User', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  updateUserData: async (req, res) => {
    try {
      const { id } = req.params
      const { userName, userEmail, userPhone, userBio } = req.body
      const setData = {
        user_name: userName,
        user_email: userEmail,
        user_phone: userPhone,
        user_bio: userBio,
        user_image: req.file ? req.file.filename : ''
      }
      const checkDataById = await userModel.getDataById(id)
      const result = await userModel.updateData(setData, id)
      if (checkDataById.length > 0) {
        console.log(result)
        fs.stat(
          `src/uploads/${checkDataById[0].user_image}`,
          function (err, stats) {
            console.log(stats) // here we got all information of file in stats variable
            if (err) {
              return console.error(err)
            }
            fs.unlink(
              `src/uploads/${checkDataById[0].user_image}`,
              function (err) {
                if (err) return console.log(err)
                console.log('file deleted successfully')
              }
            )
          }
        )
        return helper.response(
          res,
          200,
          `Succes Update Data User By Id: ${id}`,
          result
        )
      } else {
        return helper.response(
          res,
          404,
          `Data User By Id: ${id} Not Found`,
          null
        )
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  updateUserPasswrod: async (req, res) => {
    try {
      const { id } = req.params
      const { newPassword, confirmPassword } = req.body
      const salt = bcrypt.genSaltSync(10)
      const checkDataById = await userModel.getDataById(id)

      if (checkDataById.length > 0) {
        if (newPassword === confirmPassword) {
          const encryptedPassword = bcrypt.hashSync(newPassword, salt)
          const setData = {
            user_password: encryptedPassword,
            user_updated_at: new Date(Date.now())
          }

          const result = await userModel.updateData(setData, id)
          delete result.user_password

          return helper.response(res, 200, 'Success Update Password', result)
        } else {
          return helper.response(
            res,
            401,
            "New And Confirm Password Didn't Match"
          )
        }
      } else {
        return helper.response(
          res,
          404,
          `Data User By Id: ${id} Not Found`,
          null
        )
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
