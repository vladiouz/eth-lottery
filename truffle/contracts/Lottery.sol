// SPDX-License-Identifier: ISC

pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

import { Ownable } from "./Ownable.sol";

contract Lottery is Ownable {
    
    struct Bet {
        address payable bettor;
        uint256 amount;
    }

    Bet[] public bets;

    function bet() public payable {
        require(msg.value > 0, "Bet amount should be greater than 0");
        bets.push(Bet(msg.sender, msg.value));
    }

    function getBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }

    function selectWinner() public onlyOwner {
        require(bets.length > 0, "No bets placed");

        uint256 totalAmount = 0;
        for (uint256 i = 0; i < bets.length; i++) {
            totalAmount += bets[i].amount;
        }

        uint256 randomValue = random() % totalAmount;
        uint256 cumulativeAmount = 0;
        uint256 winnerIndex;

        for (uint256 i = 0; i < bets.length; i++) {
            cumulativeAmount += bets[i].amount;
            if (randomValue < cumulativeAmount) {
                winnerIndex = i;
                break;
            }
        }

        bets[winnerIndex].bettor.transfer(address(this).balance);
        delete bets;
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, bets.length)));
    }

    function getBets() public view onlyOwner returns (Bet[] memory) {
        return bets;
    }

}
