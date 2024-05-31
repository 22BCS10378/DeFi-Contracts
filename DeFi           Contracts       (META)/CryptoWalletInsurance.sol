// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoWalletInsurance {
    address public owner;
    uint256 public premium;
    uint256 public coverageAmount;
    mapping(address => uint256) public lastPayment;
    mapping(address => bool) public isActivePolicy;

    event PremiumPaid(address indexed user, uint256 amount, uint256 timestamp);
    event Claim(address indexed user, uint256 amount, uint256 timestamp);

    constructor(uint256 _premium, uint256 _coverageAmount) {
        owner = msg.sender;
        premium = _premium;
        coverageAmount = _coverageAmount;
    }

    function payPremium() external payable {
        require(msg.value == premium, "Incorrect premium amount");
        lastPayment[msg.sender] = block.timestamp;
        isActivePolicy[msg.sender] = true;
        emit PremiumPaid(msg.sender, msg.value, block.timestamp);
    }

    function claimInsurance() external {
        require(isActivePolicy[msg.sender], "No active policy");
        // Add more checks if necessary, e.g., claim event verification
        isActivePolicy[msg.sender] = false;
        payable(msg.sender).transfer(coverageAmount);
        emit Claim(msg.sender, coverageAmount, block.timestamp);
    }

    receive() external payable {}
}
