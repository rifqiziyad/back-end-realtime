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
        'SELECT * FROM contact JOIN user ON contact.user_id = user.user_id WHERE contact.friend_id = ?',
        id,
        (error, result) => {
          console.log(error)
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  getAllData: (id, search) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM user WHERE user_id != ${id} AND user_name LIKE '%${search}%'`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  }
}
