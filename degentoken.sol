// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol"; // Import the Hardhat console library

contract DegenToken is ERC20, Ownable {
    constructor() ERC20("Degen", "DGN") {}

    event RedeemItem(address indexed user, uint256 itemId, uint256 quantity);

    struct InGameItem {
        uint256 itemId;
        string name;
        uint256 cost;
    }

    mapping(uint256 => InGameItem) public items;

    uint256 private nextItemId = 1;

    function addInGameItem(string memory name, uint256 cost) external onlyOwner {
        items[nextItemId] = InGameItem(nextItemId, name, cost);
        nextItemId++;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address receiver, uint256 value) external {
        require(balanceOf(msg.sender) >= value, "Insufficient Degen Tokens");
        _transfer(msg.sender, receiver, value);
    }

    function redeemTokens(uint256 itemId, uint256 quantity) external {
        require(balanceOf(msg.sender) >= items[itemId].cost * quantity, "Insufficient Degen Tokens");

        uint256 totalCost = items[itemId].cost * quantity;
        _burn(msg.sender, totalCost);

        emit RedeemItem(msg.sender, itemId, quantity);
        console.log("Redemption successful for user %s. ItemId: %s, Quantity: %s", msg.sender, itemId, quantity);
    }

    function checkBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        _burn(msg.sender, amount);
    }
}
