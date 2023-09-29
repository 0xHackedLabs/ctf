// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IStakePoolFlashloanReceiver {
    function onStakPoolFlashloan(uint256 amount, uint256 fee, bytes memory data) external payable;
}

contract StakePool {
    bool public solved = false;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    bool public flag = false;

    constructor() payable {
        totalSupply = 5 ether;
    }

    function deposit() external payable returns (uint256) {
        uint256 amount = msg.value;
        uint256 bal = address(this).balance;
        uint256 shares = totalSupply == 0 ? amount : amount * totalSupply / bal;

        totalSupply += shares;
        balanceOf[msg.sender] += shares;
        return shares;
    }

    function withdraw(uint256 shares) external returns (uint256) {
        uint256 bal = address(this).balance;
        uint256 amount = shares * bal / totalSupply;
        totalSupply -= shares;
        require(balanceOf[msg.sender] >= shares);
        balanceOf[msg.sender] -= shares;

        payable(msg.sender).transfer(amount);
        return amount;
    }

    function flashloan(uint256 amount, bytes calldata data) external {
        uint256 balBefore = address(this).balance;
        require(amount <= balBefore);
        uint256 feeAmount = amount * 5 / 10000;
        IStakePoolFlashloanReceiver(msg.sender).onStakPoolFlashloan{value: amount}(amount, feeAmount, data);

        uint256 balAfter = address(this).balance;

        require(balAfter >= feeAmount + balBefore, "failed");
    }

    function faucet() public {
        require(!flag);
        flag = true;
        payable(msg.sender).transfer(0.001 ether);
    }

    function solve() public {
        require(address(this).balance < 1 ether);
        solved = true;
    }
}
