// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Random} from "../src/Demo/Random.sol";
import {AdultOtter} from "../src/AdultOtter/AdultOtter.sol";
import {BabyOtter} from "../src/BabyOtter/BabyOtter.sol";
import {Bytedance} from "../src/Bytedance/Bytedance.sol";
import {EasyECDSA} from "../src/EasyECDSA/EasyECDSA.sol";
import {Factorial} from "../src/Factorial/Factorial.sol";
import {Snakes} from "../src/Snakes/Snakes.sol";
import {StakePool} from "../src/StakePool/StakePool.sol";
import {ChildOtter} from "../src/ChildOtter/ChildOtter.sol";

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        Random ra = new Random();
        console2.log("Deploy Random: %s", address(ra));

        AdultOtter ao = new AdultOtter();
        console2.log("Deploy AdultOtter: %s", address(ao));

        BabyOtter bo = new BabyOtter();

        console2.log("Deploy BabyOtter: %s", address(bo));

        Bytedance bd = new Bytedance();
        console2.log("Deploy Bytedance: %s", address(bd));

        EasyECDSA ee = new EasyECDSA();
        console2.log("Deploy EasyECDSA: %s", address(ee));

        Factorial fa = new Factorial();
        console2.log("Deploy Factorial: %s", address(fa));

        Snakes sn = new Snakes();
        console2.log("Deploy Snakes: %s", address(sn));

        StakePool sp = (new StakePool){value: 5 ether}();
        console2.log("Deploy StakePool: %s", address(sp));

        ChildOtter co = new ChildOtter();
        console2.log("Deploy ChildOtter: %s", address(co));

    }
}
