// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Deployer {
    constructor(bytes memory code) {
        assembly {
            return(add(code, 0x20), mload(code))
        }
    }
}

contract Bytedance {
    bool public solved = false;
    address public target;

    function setup() public {
        target = msg.sender;
        uint256 size;
        assembly {
            size := extcodesize(sload(target.slot))
        }
        require(size == 0);
    }

    function echo(bytes memory data) internal {
        bytes memory code;
        uint256 size;
        address t = target;
        assembly {
            size := extcodesize(t)
            code := mload(0x40)
            mstore(0x40, add(code, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            mstore(code, size)
            extcodecopy(t, add(code, 0x20), 0, size)
        }
        code = abi.encodePacked(data, code);
        address new_target = address(new Deployer(code));
        (, bytes memory result) = new_target.staticcall("");
        require(keccak256(result) == keccak256(data), "wrong echo");
    }

    function solve() public {
        echo("Hello Player");
        echo("`*V");
        solved = true;
    }
}