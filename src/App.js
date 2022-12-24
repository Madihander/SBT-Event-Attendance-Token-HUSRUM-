import React, { useState } from 'react';
import Web3 from 'web3';
import abi from './contracts/abi.json';
// const { abi } = require('./abi.json');

const App = () => {
  const [inputValue, setInputValue] = useState('');
  const [contract, setContract] = useState(null);

  const handleInputChange = (event) => {
    setInputValue(event.target.value);
  };

  const handleButtonClick = async () => {
    const web3 = new Web3(window.ethereum);
    const address ='0x1137d9B877f18271DBae7A52857381ae0A399aD5';
    const contract = new web3.eth.Contract(abi, inputValue);
    setContract(contract);
    await contract.methods.safeMint(inputValue).call({
      from: address,
    });
  };

  return (
    <div>
      <p>{inputValue}</p>
      <input value={inputValue} onChange={handleInputChange} />
      <button onClick={handleButtonClick}>Sign Message</button>
    </div>
  );
};

export default App;
