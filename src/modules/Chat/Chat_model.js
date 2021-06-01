const connection = require('../../config/mysql')

module.exports = {
  createData: (data) => {
    return new Promise((resolve, reject) => {
      connection.query('INSERT INTO chat SET ?', data, (error, result) => {
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
  getDataChat: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM `user` JOIN chat ON user.user_id = chat.sender_id WHERE chat.room_chat = ? ',
        id,
        (error, result) => {
          console.log(error)
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  }
}
