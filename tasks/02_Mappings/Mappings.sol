pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract YourContract {

  //define mapping
  mapping(address => uint256) public userBalance;

  string public _purpose = "Task: Mappings";

  constructor() payable {
    // what should we do on deploy?
  }

  //deposit amount into address
  function deposit(uint256 _amount) public {
    //increase user's address by amount
    userBalance[msg.sender] += _amount;
  } 

  //check balance
  function checkBalance() public view returns (uint256) {
    //intialize amount to value in user's address
    return userBalance[msg.sender]; 
  }

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
