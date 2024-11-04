// SPDX-License-Identifier: MIT
// solhint-disable comprehensive-interface
pragma solidity 0.8.24;

import {BadRecipient} from "../src/BadRecipient.sol";
import {BatchTransfer} from "../src/BatchTransfer.sol";
import {Test} from "forge-std/Test.sol";

contract BadRecipientTest is Test {
    function testBadRecipient() public {
        BatchTransfer batchTransfer = new BatchTransfer();

        address payable[] memory recipients = new address payable[](10);
        uint256[] memory amounts = new uint256[](10);

        for (uint256 i = 0; i < 10; i++) {
            BadRecipient recipient = new BadRecipient();

            recipients[i] = payable(address(recipient));
            amounts[i] = 1 ether;
        }

        // batchTransfer.batchTransfer{value: 10 ether}(recipients, amounts);
        (bool ret,) = address(batchTransfer).call{value: 10 ether, gas: 1_000_000}(
            abi.encodeWithSignature("batchTransfer(address[],uint256[])", recipients, amounts)
        );

        assertTrue(ret);
    }
}
