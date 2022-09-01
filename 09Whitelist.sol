//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

contract WhiteList{

    address public immutable owner;
    uint public maxWhitelistedAddresses;
    address[] public WhiteListAddresses; //store array of addresses that are in whitelisted 
    mapping(address => bool) theList;

    modifier onlyOwner(){
        require(msg.sender == owner, "Error: 'Ownership priviledges not found.");
        _;
    }

    constructor(address _owner, uint _maxWhitelistedAddresses){
        owner = _owner;
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function enterWhitelist(address _addr) public onlyOwner{
        require(WhiteListAddresses.length < maxWhitelistedAddresses, "The whitelist is filled.");
        theList[_addr] = true;
        WhiteListAddresses.push(_addr);
    }

    function showWhiteList(address _addr) public view returns(bool){
        return theList[_addr];
    }
}