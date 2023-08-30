// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/token/ERC20/IERC20.sol";
import "openzeppelin-contracts/access/Ownable.sol";
import "openzeppelin-contracts/security/ReentrancyGuard.sol";
import "openzeppelin-contracts/utils/cryptography/ECDSA.sol";

contract CkIcp is ERC20, Ownable, ReentrancyGuard {
    using ECDSA for bytes32;

    event BurnToIcp(uint256 amount, bytes32 indexed principal, bytes32 indexed subaccount);
    
    constructor()
        ERC20("ckICP - native ICP token on Ethereum", "ckICP")
    {}

    /// # Admin functions accessible to ckICP canister only

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /// # Public functions

    function burn(uint256 amount, bytes32 principal, bytes32 subaccount) public {
        _burn(_msgSender(), amount);
        emit BurnToIcp(amount, principal, subaccount);
    }

    /// # Overrides
    function _mint(address to, uint256 amount) internal override(ERC20) {
        super._mint(to, amount);
    }

    function _burn(address from, uint256 amount) internal override(ERC20) {
        super._burn(from, amount);
    }
}
