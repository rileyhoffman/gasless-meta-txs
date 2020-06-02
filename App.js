import React, { Component } from 'react'
import Web3 from 'web3'
import './App.css'
import payback from './payback.json'

class App extends Component {
  componentDidMount() {
    this.loadBlockchainData()
  }

  async loadBlockchainData() {
    const web3 = new Web3(Web3.givenProvider || "http://localhost:7545")
    const accounts = await web3.eth.getAccounts()
    const networkId = await web3.eth.net.getId()
    const payback = web3.eth.Contract(payback.abi, payback.networks[networkId].address)
  }




  /*const click = () => {
      payback.methods.click.send({ from: account })
  }

  const eligibilityCheck = () => {
    payback.methods.eligibilityCheck.call({ from: account })
  }*/

  const payout = () => {
      this.refs.btn.setAttribute("disabled", "disabled")
      payback.methods.click().send({ from: account[0] })
      payback.events.Payout.({
        fromBlock: 
      }).watch(function(err, e){
          if (err) {
            console.log(err);
          } else {
            this.btn.removeAttribute("disabled")
          }
          } //I think my javascript is probably sus here
        }

  }

  

  render() {
    return (
      <div className="container">
        <button ref={btn => { this.btn = btn; }}  
        onClick={payout}>
          Choce Me
        </button>
      </div>
    );
  }
}

export default App;