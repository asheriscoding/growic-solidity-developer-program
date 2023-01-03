//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

//gets student info and registers student
contract StudentRegistration {

  //setting contract purpose
  string public purpose = "Register Students";

  address public owner;

  //mapping of address to struct Students
  mapping(address => Students) public students;

  //constructor where owner is equal to msg.sender
  constructor() {
    owner = msg.sender;
  }

  //modifier that requires msg.sender is the owner
  modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    //struct containing student details
    struct Students {
      address studentID;
      string name;
      string dateOfBirth;
      uint percentage;
      uint totalMarks;
      bool alreadyExists;
    }

    //function to register student
    function registerStudent(address studentID, string memory name, 
      string memory dateOfBirth, uint percentage, uint totalMarks) public onlyOwner {
        
        //require that the student is not already registered
        require(students[studentID].alreadyExists == false, "Student already registered.");
        
        //assigning student info to the key in the mapping
        students[studentID]=Students(studentID, name, dateOfBirth, percentage, totalMarks, true);
    }
    
    //function that returns student details
    function getStudentDetails(address studentID) public view returns(address,string memory,uint256,uint256) {
      //return student info
      return(students[studentID].studentID, students[studentID].name,
             students[studentID].totalMarks,students[studentID].percentage);
    }


  //to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {} 

}  

