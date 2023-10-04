//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    address private immutable i_owner;

    constructor(uint256 _initialSupply) ERC20("OurToken", "OTK") {
        _mint(msg.sender, _initialSupply);
        i_owner = msg.sender;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn a specific amount of tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner);
        _;
    }
}
