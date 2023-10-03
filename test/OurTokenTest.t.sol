//SPDX-License-identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployToken;

    function setUp() external {
        deployToken = new DeployOurToken();
        ourToken = deployToken.run();
    }
}
