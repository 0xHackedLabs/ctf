// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ChildOtter {
    mapping(uint => mapping(uint => uint)) val;
    bool public solved = false;

    function solve(uint x) public {
      uint target;

      val[0][0] = x;
      assembly {
        target := mload(32)
      }

      assert(target == x);
      solved = true;
    }
}