const connection = require('../../config/mysql')

module.exports = {
  register: (data) => {
    return new Promise((resolve, reject) => {
      connection.query('INSERT INTO user SET ?', data, (error, result) => {
        if (!error) {
          const newData = {
            ...data
          }
          resolve(newData)
        } else {
          reject(new Error(error))
        }
      })
    })
  },
  checkDataUser: (data) => {
    return new Promise((resolve, reject) => {
      connection.query('SELECT * FROM user WHERE ?', data, (error, result) => {
        !error ? resolve(result) : reject(new Error(error))
      })
    })
  },
  verifiedUser: (setData, id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `UPDATE user SET ? WHERE user_id = '${id}'`,
        setData,
        (error, result) => {
          if (!error) {
            const newResult = {
              id: result.id,
              ...setData
            }
            resolve(newResult)
          } else {
            reject(new Error(error))
          }
        }
      )
    })
  }
}
