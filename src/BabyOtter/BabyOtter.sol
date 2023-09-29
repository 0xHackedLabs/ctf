// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BabyOtter {
    bool public solved = false;

    function solve(uint x) public {
        unchecked {
            assert(x * 0x1337 == 1);
        }
        solved = true;
    }
}