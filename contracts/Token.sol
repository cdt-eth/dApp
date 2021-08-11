//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
    string public name = "CDToken";
    string public symbol = "CDT";

    uint256 public totalSupply = 1000000;

    // equivalent to object in JS
    // const balances = { address: uint }
    mapping(address => uint256) balances;

    // set my balance to total supply (all tokens)
    constructor() {
        balances[msg.sender] = totalSupply;
    }

    // determine who and how many tokens we're sending
    function transfer(address to, uint256 amount) external {
        // check if there's enough tokens to send
        require(balances[msg.sender] >= amount, "Not enough tokens");

        // subtract amount from sender
        balances[msg.sender] -= amount;

        // increase receiver's balance by amount
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
