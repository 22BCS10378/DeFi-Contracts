// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CryptoWalletInsurance.sol";
import "./CollateralProtectionInsurance.sol";

contract InsuranceFactory {
    address public owner;
    address[] public cryptoWalletInsurancePolicies;
    address[] public collateralProtectionInsurancePolicies;

    event NewCryptoWalletInsurance(address policy);
    event NewCollateralProtectionInsurance(address policy);

    constructor() {
        owner = msg.sender;
    }

    function createCryptoWalletInsurance(uint256 premium, uint256 coverageAmount) external {
        require(msg.sender == owner, "Only owner can create policies");
        CryptoWalletInsurance newPolicy = new CryptoWalletInsurance(premium, coverageAmount);
        cryptoWalletInsurancePolicies.push(address(newPolicy));
        emit NewCryptoWalletInsurance(address(newPolicy));
    }

    function createCollateralProtectionInsurance(uint256 premium, uint256 fullCoveragePercentage, uint256 partialCoveragePercentage) external {
        require(msg.sender == owner, "Only owner can create policies");
        CollateralProtectionInsurance newPolicy = new CollateralProtectionInsurance(premium, fullCoveragePercentage, partialCoveragePercentage);
        collateralProtectionInsurancePolicies.push(address(newPolicy));
        emit NewCollateralProtectionInsurance(address(newPolicy));
    }

    function getCryptoWalletInsurancePolicies() external view returns (address[] memory) {
        return cryptoWalletInsurancePolicies;
    }

    function getCollateralProtectionInsurancePolicies() external view returns (address[] memory) {
        return collateralProtectionInsurancePolicies;
    }
}
