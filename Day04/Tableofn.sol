//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

contract Table{
    uint256 num;
    uint[] multiplytable;
    constructor(uint256 _num) {
        _num = num;
    }    
    function table() public returns(uint[] memory){
        for(uint i=1;i<=10;i++){
           multiplytable.push(num * i);            
        }
        return multiplytable;
    }
}
