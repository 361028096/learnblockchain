//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract MyERC20 is ERC20 {

    uint public counter;

    constructor() ERC20("MyERC20", "MyERC20") {
        counter = 0;
        _mint(msg.sender, 0 * 10 ** 18);
    }

    function mintToken(uint amount) public {
        _mint(msg.sender, amount);
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