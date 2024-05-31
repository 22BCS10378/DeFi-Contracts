# DeFi Insurance Protocol

## Overview

This project implements a decentralized insurance protocol using Solidity. The protocol offers two types of insurance:
1. **Crypto Wallet Insurance**: Protects smart contract wallet owners from hacks.
2. **Collateral Protection for Crypto-backed Loans**: Provides insurance based on the user's policy when collateral value drops.

## Contracts

1. **CryptoWalletInsurance.sol**: Manages wallet insurance policies.
2. **CollateralProtectionInsurance.sol**: Manages loan collateral protection policies.
3. **InsuranceFactory.sol**: Factory contract to deploy individual insurance contracts for users.

## Features

- Users can pay premiums to activate their insurance policies.
- Users can claim insurance based on the specified conditions.
- Factory contract model deploys separate insurance contracts for each user.

## Getting Started

### Prerequisites

- [Remix IDE](https://remix.ethereum.org/)

### Files

- `CryptoWalletInsurance.sol`
- `CollateralProtectionInsurance.sol`
- `InsuranceFactory.sol`

### Installation

1. **Open Remix IDE:**
   Go to [Remix IDE](https://remix.ethereum.org/).

2. **Create New Files:**
   Create three new files in the Remix IDE.

3. **Paste the Code:**
   Paste the respective code into each file.

### Compilation

1. **Compile the Contracts:**
   - Select the "Solidity Compiler" tab on the left.
   - Ensure the compiler version is set to at least 0.8.0.

### Deployment

1. **Deploy the Contracts:**
   - Select the "Deploy & Run Transactions" tab on the left.
   - Ensure "JavaScript VM" is selected as the environment.

2. **Deploy `CryptoWalletInsurance.sol`:**
   - Select `CryptoWalletInsurance` from the dropdown.

3. **Deploy `CollateralProtectionInsurance.sol`:**
   - Select `CollateralProtectionInsurance` from the dropdown.

4. **Deploy `InsuranceFactory.sol`:**
   - Select `InsuranceFactory` from the dropdown.

### Interaction

You can now interact with the deployed contracts. For example, you can:
- Use the `payPremium` function on the `CryptoWalletInsurance` and `CollateralProtectionInsurance` contracts.
- Use the `claimInsurance` function to claim the insurance.
- Use the `createCryptoWalletInsurance` and `createCollateralProtectionInsurance` functions on the `InsuranceFactory` contract to create new policies.

## Testing

- Use a testnet (e.g., Rinkeby) for deployment and testing.

## License

This project is licensed under the MIT License.
