# ERC20 OurToken

This repository contains the implementation of an ERC20 token named "OurToken" using the Foundry framework. The token can be deployed and tested on a local chain using Anvil.

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Deployment](#deployment)
- [Testing](#testing)
- [License](#license)
- [Cloning the Repository](#cloning-the-repository)

## Introduction

The project implements an ERC20 token named "OurToken" with the capabilities of minting new tokens and burning existing tokens. It is built using the Foundry framework and can be tested on a local chain using Anvil.

## Installation

To use this project, you need to have the Foundry framework and Anvil set up in your local environment.

## Cloning the Repository

To clone this repository and get a copy of the project locally, run the following command in your terminal:

```bash
git clone https://github.com/shrutic11/erc20-our-token.git
```

This will clone the repository to your local machine. You can then navigate to the project directory using:

```bash
cd erc20-our-token
```

After cloning, you can follow the instructions in the README for installation, usage, deployment, and testing as described.

## Usage

The main contract `OurToken.sol` implements the ERC20 standard with additional functionality for minting and burning tokens. The contract uses the OpenZeppelin ERC20 implementation for the standard ERC20 features.

## Deployment

To deploy the "OurToken" contract, utilize the `DeployOurToken.sol` script, which creates and deploys the `OurToken` contract with an initial supply of tokens.

```solidity
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract DeployOurToken is Script {
    uint256 private constant INITIAL_SUPPLY = 100 ether;

    function run() external returns (OurToken) {
        vm.startBroadcast();
        OurToken ourToken = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return ourToken;
    }
}
```

## Testing

The testing scripts are provided in the `OurTokenTest.sol` file. These scripts test various functionalities of the `OurToken` contract, including balance transfers, approvals, total supply, symbol, name, decimals, and burning.

To run the tests, compile and deploy the contract, and then execute the tests using your preferred Solidity testing framework.

```solidity
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    // ... test functions and setup ...
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---