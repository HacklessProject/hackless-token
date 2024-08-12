// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract HacklessToken is ERC20, AccessControl {
    ///@notice The role with which users can burn their token amounts.
    ///@dev Role can be setup, grant, remove and other by admin with openzeppelin AccessControl helper.
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    ///@notice Create HKLS token. Setup admin, burner role and mint 20m tokens to deployer.
    constructor() ERC20("Hackless Token", "HKLS") {
        _mint(msg.sender, 20 * 10**6 * 10**18);
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(BURNER_ROLE, msg.sender);
    }

    ///@notice Burn tokens.
    ///@param amount Amount of tokens to burn.
    ///@dev Only burner role can burn tokens.
    function burn(uint256 amount) public onlyRole(BURNER_ROLE) {
        _burn(msg.sender, amount);
    }
}