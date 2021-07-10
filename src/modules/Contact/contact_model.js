const connection = require('../../config/mysql')

module.exports = {
  createData: (data) => {
    return new Promise((resolve, reject) => {
      connection.query('INSERT INTO contact SET ?', data, (error, result) => {
        if (!error) {
          const newData = {
            id: result.insertId,
            ...data
          }
          resolve(newData)
        } else {
          reject(new Error(error))
        }
      })
    })
  },
  getDataById: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM user WHERE user_email = ?',
        id,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  getAllData: (id, search) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT user.user_id, user.user_name, user.user_image, contact.user_id AS contact_user_id, friend_id FROM user LEFT JOIN contact ON user.user_id = contact.user_id WHERE user.user_id != ${id} AND user_name LIKE '%${search}%' GROUP BY user.user_id`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  getAllContact: (id, search) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM contact JOIN user ON contact.friend_id = user.user_id WHERE contact.user_id = ${id} AND user_name LIKE '%${search}%'`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  }
}
