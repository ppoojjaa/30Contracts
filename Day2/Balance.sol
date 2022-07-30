// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Balance{
    address owner;
    uint value;

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint amt) public {
        value += amt;
    }


    function checkBalance() public view returns(uint256){
        return value;
    }
}
