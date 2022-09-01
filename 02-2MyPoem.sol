//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract myPoem{
    // 1. 
    // string poet = "Poet1";
    // string poem = "Here goes the poem";
    // function createPoem() public pure returns(string memory, string memory){
    //     return (poem,poet);
    // }

    //2.
    function createPoem(string memory poem, string memory poet) public pure returns(string memory, string memory){
        return (poem,poet);
    }
}
