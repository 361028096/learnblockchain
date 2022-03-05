// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank{

    mapping(address => uint) public accounts;


    // 这是一个回退函数, 收到以太币会被调用
    receive() external payable {
       accounts[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // // 提取全部余额
    // function withdraw(address addr) payable public {
    //     payable(addr).transfer(address(this).balance);
    // }

    // 提取全部余额
    function withdraw() payable public {
        payable(msg.sender).transfer(address(this).balance);
    }

}