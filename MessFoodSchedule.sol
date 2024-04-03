// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.25 <0.9.0;

import "./ownable.sol";

contract foodSchedule is Ownable{
    
    

    struct studentData{
        string studentName;
        uint rollNo;
        mapping(address=>bool) voters;
    }
    mapping(uint =>studentData) public  students;

    uint public totalStudents;

    function entry(uint _rollNo, string memory _studentName) public{
        studentData storage newRequest= students[totalStudents];
        newRequest.studentName = _studentName;
        newRequest.rollNo = _rollNo;
        totalStudents++;
        

    }
    struct foodTypes{
        string name;
        uint votes;
        
        
        mapping(address=>bool) voters;
    }
    
    mapping(uint=> foodTypes) public todaysMenu;

    uint public totalFoodTypesAvailable;

    function addFoodTypes(uint _index, string memory _name) public onlyOwner{
        totalFoodTypesAvailable++;
        foodTypes storage thiRequest = todaysMenu[_index];
        
        
        thiRequest.name= _name;
    }
    
    uint public numvoting;

    function voting(uint _index) public {
        foodTypes storage thisRequest= todaysMenu[_index];
        require(thisRequest.voters[msg.sender]==false,"you already voted");
        thisRequest.voters[msg.sender]==true;
        numvoting++;
        thisRequest.votes++;
    }
}
