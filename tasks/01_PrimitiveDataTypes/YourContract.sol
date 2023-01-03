pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  event SetPurpose(address sender, string purpose);

  string public _purpose = "Task: Primitive Data Types";

  constructor() payable {
    // what should we do on deploy?
  }

  //Solidity value types

  //Signed integers
  //used to store negative and positive integers
  //there are various ranges to store different sizes (ex. int8, int16, int32 ... int256)
  //default = 0
  //use cases: store negative or positive integers in variables and determine what size storage should be
  int public exampleSignedInt1 = -31;
  int public exampleSignedInt2 = 37;

  //Unsigned integers
  //used to store integers greater or equal to 0
  //there are various ranges to store different sizes (ex. uint8, uint16, uint32 ... uint256)
  //default = 0
  //use cases: store non-negative integers in variables and determine what size storage should be
  uint public exampleUnsignedInt1 = 90;
  uint public exampleUnsignedInt2 = 0;

  //Boolean
  //true/false (binary results)
  //can use Boolean operators (!=, ==, !, &&, ||)
  //default = false
  //use cases: coding true/false to verify information, comparing data, retrieving data that meet certain specifications
  bool public exampleBool1 = false;
  bool public exampleBool2 = true;

  //Addresses
  //holds up to 160 bits
  //there are two address value types: address and address payable (can send/transfer ether)
  //use cases: send or transfer ether to and from wallets via addresses
  address public exampleAddress = 0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9;

  //Enums
  // a list that store constant values to restrict options to values given
  //can help reduce the number of bugs in code
  //use cases: want to only let users select pre-defined options when ordering something (ex. items on a menu)
  enum Colors {RED, ORANGE, YELLOW, GREEN, BLUE, PURPLE}
  enum Sizes {XSMALL, SMALL, MEDIUM, LARGE, XLARGE}

  //Bytes
  //this data type represents a sequence of bytes
  //two types of byte types: fixed-sized and dynamically-sized
  //fixed-size byte arrays: fixed size variable from 1 - 32 bytes
  //dynamically-size byte arrays: an array that is not a fixed size and can append and remove bytes
  //use cases: store data in binary format

  bytes15 public exampleFixedByte = "happy holidays";

}
