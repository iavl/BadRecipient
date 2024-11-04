// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {console} from "forge-std/console.sol";

contract BadRecipient {
    fallback() external payable {}

    receive() external payable {
        uint256 i = 0;
        while (gasleft() > 3) {
            i++;
        }
    }
}
