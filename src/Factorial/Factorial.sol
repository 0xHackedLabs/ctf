// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Factorial {
    bool public solved = false;

    function run(uint256 number) internal view returns (uint256) {
        uint256 res = 1;
        for (uint256 index = 0; index < number; index++) {
            (, bytes memory data) = msg.sender.staticcall(abi.encodeWithSignature("factorial(uint256)", number));
            res = res * abi.decode(data, (uint256));
        }
        return res;
    }

    function solve() public {
        require(run(5) == 120, "wrong");
        solved = true;
    }
}