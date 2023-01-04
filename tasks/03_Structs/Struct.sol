pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract YourContract {

  //define mapping
  mapping(address => uint256) public userBalance;

  //define struct
  struct Customer {
    string name;
    uint256 age;
  }

  //new data structure named customer
  Customer public customer; 

  //linking users address to customers information from struct into mapping
  mapping(address => Customer) public customerInfo;
 
  string public _purpose = "Task: Structures";

  constructor() payable {
    // what should we do on deploy?
  }

  //saves details of user calling contract into customers structure
  function setUserDetails(string calldata name, uint256 age) external {
    //initialize new customer
    customer = Customer(name, age);

    //map customer data to address
    customerInfo[msg.sender] = customer;

    }

  //retrieves and returns the details saved for the user calling the contract
  function getUserDetail() public view returns (string memory, uint256) { 
    Customer storage customer1 = customerInfo[msg.sender];
    return (customer1.name, customer1.age);
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
