//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Level0} from "../src/Level0.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

contract Level0Solution is Script {
    Level0 public level0 = Level0(0xe240E81Adb8cb4966be1BE7293c54601aaE6832d);

    function run() external {
        string memory password = level0.password();
        console.log("Password: ", password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0.authenticate(password);
        vm.stopBroadcast();
    }
}
