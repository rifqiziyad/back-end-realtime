const helper = require('../../helpers/wrapper')
const bcrypt = require('bcrypt')
const authModel = require('./auth_model')
const jwt = require('jsonwebtoken')
const nodemailer = require('nodemailer')
require('dotenv').config()

module.exports = {
  register: async (req, res) => {
    try {
      const { userName, userEmail, userPassword, userPhone } = req.body
      const salt = bcrypt.genSaltSync(10)
      const encryptPassword = bcrypt.hashSync(userPassword, salt)
      const setData = {
        user_id:
          Math.random().toString(36).substring(2) +
          new Date().getTime().toString(36),
        username: 'user' + parseInt(Math.random() * 1000000000000),
        user_name: userName,
        user_email: userEmail,
        user_phone: userPhone,
        user_password: encryptPassword
      }
      const getDataCondition = await authModel.checkDataUser({
        user_email: userEmail
      })
      // cek email
      if (getDataCondition.length === 0) {
        // kalau tidak ada
        const transporter = nodemailer.createTransport({
          host: 'smtp.gmail.com',
          port: 587,
          secure: false, // true for 465, false for other ports
          auth: {
            user: process.env.SMTP_EMAIL, // generated ethereal user
            pass: process.env.SMTP_PASSWORD // generated ethereal password
          }
        })
        const result = await authModel.register(setData)
        delete result.user_password
        const mailOptions = {
          from: '"Telegram App" <rifqiziyad4@gmail.com>', // sender address
          to: userEmail, // list of receivers
          subject: 'Telegram App - Activation Email', // Subject line
          html: `<b>Click Here to activate </b><a href='http://localhost:3003/backend3/api/v1/auth/verif/${result.id}'>Click !</a>` // html body
        }
        await transporter.sendMail(mailOptions, function (error, info) {
          if (error) {
            return helper.response(res, 408, 'Email not send !')
          } else {
            console.log('Email sent:' + info.response)
            return helper.response(res, 200, 'Check Your Email', result)
          }
        })
      } else {
        // kalau sudah terdaftar
        return helper.response(res, 404, `${userEmail} Registered`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  login: async (req, res) => {
    try {
      const { userEmail, userPassword } = req.body
      const checkEmail = await authModel.checkDataUser({
        user_email: userEmail
      })

      // cek email
      if (checkEmail.length > 0 && checkEmail[0].user_verification === 1) {
        const checkPassword = bcrypt.compareSync(
          userPassword,
          checkEmail[0].user_password
        )
        if (checkPassword) {
          // kalau password sesuai
          const payload = checkEmail[0]
          delete payload.user_password
          const token = jwt.sign({ ...payload }, 'RAHASIA', {
            expiresIn: '1d'
          })
          const result = { ...payload, token }
          return helper.response(res, 200, 'Succes Login', result)
        } else {
          // kalau password tidak sesuai
          return helper.response(res, 404, 'Wrong password')
        }
      } else {
        return helper.response(
          res,
          404,
          `${userEmail} is not registered / not verified`
        )
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Requet', error)
    }
  },
  userVerification: async (req, res) => {
    try {
      const { id } = req.params
      const setData = {
        user_verification: 1
      }

      const getUserId = await authModel.checkDataUser(id)
      await authModel.verifiedUser(setData, id)
      if (getUserId.length > 0) {
        return helper.response(res, 200, 'Succes User Verification')
      } else {
        return helper.response(res, 404, `Data By Id ${id} Not Found`, null)
      }
    } catch (error) {
      console.log(error)
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
