const { app } = require('./app')

require('dotenv').config()
const portRoute = process.env.PORT

app.listen(portRoute, () => {
        console.log(`Server is running in ${portRoute}.`)
})


