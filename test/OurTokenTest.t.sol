// SPDX-License-identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployToken;

    address BOB = makeAddr("BOB");
    address ALICE = makeAddr("ALICE");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() external {
        deployToken = new DeployOurToken();
        ourToken = deployToken.run();

        vm.prank(msg.sender);
        ourToken.transfer(BOB, STARTING_BALANCE);
    }

    function testBobsBalance() public {
        assertEq(ourToken.balanceOf(BOB), STARTING_BALANCE);
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;
        vm.prank(BOB);
        ourToken.approve(ALICE, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(ALICE);
        ourToken.transferFrom(BOB, ALICE, transferAmount);

        assertEq(ourToken.balanceOf(ALICE), transferAmount);
        assertEq(ourToken.balanceOf(BOB), STARTING_BALANCE - transferAmount);
    }

    function testTotalSupply() public {
        assertEq(ourToken.totalSupply(), STARTING_BALANCE);
    }

    function testSymbol() public {
        assertEq(ourToken.symbol(), "OTK");
    }

    function testName() public {
        assertEq(ourToken.name(), "OurToken");
    }

    function testDecimals() public {
        assertEq(ourToken.decimals(), 18); // Assuming standard 18 decimals
    }

    function testTransfer() public {
        uint256 transferAmount = 50 ether;

        vm.prank(BOB);
        ourToken.transfer(ALICE, transferAmount);

        assertEq(ourToken.balanceOf(ALICE), transferAmount);
        assertEq(ourToken.balanceOf(BOB), STARTING_BALANCE - transferAmount);
    }

    function testBurn() public {
        uint256 burnAmount = 20 ether;

        vm.prank(BOB);
        ourToken.burn(burnAmount);

        assertEq(ourToken.balanceOf(BOB), STARTING_BALANCE - burnAmount);
        assertEq(ourToken.totalSupply(), STARTING_BALANCE - burnAmount);
    }
}
