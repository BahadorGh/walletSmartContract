// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract EtherWallet {
    address payable public owner;

    event Deposit(address indexed sender, uint256 amount);

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external returns (bool) {
        require(msg.sender == owner, "Caller must be the owner!");
        payable(msg.sender).transfer(_amount);
        return true;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
