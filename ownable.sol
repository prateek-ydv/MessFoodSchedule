// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.25 <0.9.0;

contract Ownable{
    address public _owner;
    
    constructor () public {
        _owner = msg.sender;
    }
    modifier onlyOwner() {
        require(isOwner() ,"you are not the owner");
        _;
    }
    function isOwner() public view returns(bool){
        return(msg.sender == _owner);
    }
}
