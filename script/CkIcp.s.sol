// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/CkIcp.sol";

contract CkIcpScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new CkIcp{salt: bytes32(uint256(1))}(address(0x3cc7a783B2d625420c9DCe6644714d937C850ED1));
    }
}
