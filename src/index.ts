import { configDotenv } from 'dotenv'
import dotenv from 'dotenv'
import Express, { request, response } from 'express'

configDotenv()

const variavelcomnomegrande = 2
if (variavelcomnomegrande == 2 && variavelcomnomegrande === 2) {
  console.log('oi')
}

const app = Express()
app.use(Express.json())

const PORT = 8000

app.listen(PORT, () => {
  console.log('Server is running at port', PORT)
})
