// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract AgeChecker {
    uint8 inputAge;
    constructor(uint8 _age){
        inputAge = _age;
    }

    function ageChecker(uint8 inputAge) public pure returns(string memory) {
        if(inputAge <= 3){
            return "Infant";
        }else if(inputAge <= 13){
            return "Pre-Teen";
        }else if(inputAge <= 18){
            return "Teen";
        }else{
            return "Adult";
        }
    }

}
