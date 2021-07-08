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
      const { userName, userPhone, userBio, username } = req.body
      const checkDataById = await userModel.getDataById(id)
      const setData = {
        username: username !== undefined ? username : checkDataById[0].username,
        user_name:
          userName !== undefined ? userName : checkDataById[0].user_name,
        user_phone:
          userPhone !== undefined ? userPhone : checkDataById[0].user_phone,
        user_bio: userBio !== undefined ? userBio : checkDataById[0].user_bio,
        user_updated_at: new Date(Date.now())
      }

      const result = await userModel.updateData(setData, id)
      if (checkDataById.length > 0) {
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
  updataImage: async (req, res) => {
    try {
      const { id } = req.params
      const checkDataById = await userModel.getDataById(id)
      const setData = {
        user_image: req.file ? req.file.filename : '',
        user_updated_at: new Date(Date.now())
      }

      fs.unlink(`src/uploads/${checkDataById[0].user_image}`, (error) => {
        error ? console.log('Image not found') : console.log('Image deleted')
      })

      const result = await userModel.updateData(setData, id)
      return helper.response(
        res,
        200,
        `Succes Update Data User By Id: ${id}`,
        result
      )
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
