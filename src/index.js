import React from 'react'
import ReactDOM from 'react-dom'
import Web3 from 'web3'

import App from './App'

ReactDOM.render(
  <App />,
  document.getElementById('root')
)
const initWeb3 = async () => {
  const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:3000'))
  return web3
}
