// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract Wallet {
    mapping(address => uint) Wallets;

    function retirer(address payable ad1, uint _amount) external {
        //require(_amount <= Wallets[msg.sender], "Solde Insuffisant");
        require(_amount <= address(this).balance, "Solde Insuffisant");
        Wallets[msg.sender] -= _amount; // Déduire le montant au lieu de réinitialiser
       ad1.transfer(_amount);
    }

    function recevoir() external payable {
        Wallets[msg.sender] += msg.value;
    }

    function getBalance() external view returns (uint) {
        return Wallets[msg.sender];
    }

  
    fallback() external payable {}
}