// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollateralProtectionInsurance {
    address public owner;
    uint256 public premium;
    uint256 public fullCoveragePercentage;
    uint256 public partialCoveragePercentage;
    mapping(address => uint256) public lastPayment;
    mapping(address => uint256) public coveragePercentage;

    event PremiumPaid(address indexed user, uint256 amount, uint256 timestamp);
    event Claim(address indexed user, uint256 amount, uint256 timestamp);

    constructor(uint256 _premium, uint256 _fullCoveragePercentage, uint256 _partialCoveragePercentage) {
        owner = msg.sender;
        premium = _premium;
        fullCoveragePercentage = _fullCoveragePercentage;
        partialCoveragePercentage = _partialCoveragePercentage;
    }

    function payPremium(bool fullCoverage) external payable {
        require(msg.value == premium, "Incorrect premium amount");
        lastPayment[msg.sender] = block.timestamp;
        coveragePercentage[msg.sender] = fullCoverage ? fullCoveragePercentage : partialCoveragePercentage;
        emit PremiumPaid(msg.sender, msg.value, block.timestamp);
    }

    function claimInsurance(uint256 loanAmount) external {
        uint256 coverageAmount = (loanAmount * coveragePercentage[msg.sender]) / 100;
        payable(msg.sender).transfer(coverageAmount);
        emit Claim(msg.sender, coverageAmount, block.timestamp);
    }

    receive() external payable {}
}
