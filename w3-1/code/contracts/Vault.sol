//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault {
    // 记录用户存款金额
    mapping(address => uint) public deposited;
    address public immutable token;

    constructor(address _token) {
        token = _token;
    }

    // transferFrom
    function deposit(address user, uint amount) public {
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "transferFrom error");
        deposited[user] += amount;
    }

    // 提取自己的存款
    function withdrawToken(address user) external {
        uint balance  = deposited[user];
        require(balance > 0, "balance error");
        require(IERC20(token).transfer(user, balance),"withdraw error");
        deposited[user] -= balance;
    }

    // 显示用户存款金额
    function balanceOf(address user) external view returns(uint balance){
        return deposited[user];
    }
}

