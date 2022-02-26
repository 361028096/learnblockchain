//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Counter {

  uint public counter;

  // constructor() {
  //   counter = 0;
  // }

  constructor(uint x) {
    counter = x;
  }

  function count() public {
    counter = counter + 1;
    console.log("current counter:",counter); 
  }

  function add(uint x) public returns(uint) {
    counter = counter + x;
    console.log("add resutl:",counter);
    return counter;
  }

  function get() public view returns (uint) {
    return counter;
  }
}