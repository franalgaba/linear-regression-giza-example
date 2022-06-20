# Linear Regression using ONNX Cairo :sparkles:

Linear Regression Smart Contract in Cairo generated with smartonnx.

## Instructions

Install the dependencies:

`poetry install`

Compile:

`nile compile`

## Deploy in local devnet

Run StarkNet devnet:

`nile node`

Deploy:

`nile deploy contract --alias linear_regression`

Usage:

`nile call linear_regression predict`

## Deploy in testnet

Deploy in StarkNet testnet:

`nile deploy contract --alias linear_regression --network goerli`

Estimate fee in testnet:

```
starknet estimate_fee \                              
    --address 0x03bccee94d478e8a6f6b116436426232521931d4231ebd1a10c1596d3094dbfc \
    --abi artifacts/abis/contract.json \
    --function predict --network alpha-goerli
```