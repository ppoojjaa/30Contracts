//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Ownable{
    address owner;

    event switchOwners(
        address indexed prevOwner,
        address indexed newOwner
    );

    constructor (){
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner, "You are not the owner of this contract");
        _;
    }

    function transferOwnership(address _adr) external onlyOwner{
        require(_adr != address(0),"Ownership cannot be transferred to no address!");
        owner = _adr;
        emit switchOwners(msg.sender, owner);
    }

    function checkOwner() public view returns(address){
        return owner;
    }

}
