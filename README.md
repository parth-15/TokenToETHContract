# TokenToETHContract

This smart contract supports and has following components: 

1. A user can send ERC20 tokens to Contract A and the contract uses *Uniswap Router* to swap the tokens for ether and stores the ether in the contract.
The data of ether stored for each user should be stored in mapping data structure.
Uniswap Router Documentation - https://uniswap.org/docs/v2/smart-contracts/router02/ , https://uniswap.org/docs/v2/smart-contract-integration/quick-start/
Use case :  For example user XYZ calls a function on contract A (input tokenToSend address, input token amount) , the function transfers the amount of token from user to the contract. The contract then swaps the token for ether using the Uniswap Router. It stores the accumulated amount of eth that is received in place of tokens for the user XYZ.

2. The user calls another function on the Contract A and the contract sends the total accumulated Ether for the particular user to the user Address.
USE CASE: User calls withdrawETH function and the contract checks the eth accumulated(through token transfers) and sends that amount of ETH to the user.

##### Following address were used for testing and validating smart contract on Ropsten testnet: 
* Address of MetaMask wallet: `0xa00efCD04c6bc0749ce21E753ADE3e3E80c02c3B`
* Address of deployed smart contract: `0xB65AAB0F0ad28Ab5A2b07a9fE9cDecb0F3cd740C` Link: https://ropsten.etherscan.io/address/0xB65AAB0F0ad28Ab5A2b07a9fE9cDecb0F3cd740C
* Approval transaction for sending WEENUS token from MetaMask wallet to Smart Contract deployed above. Link: https://ropsten.etherscan.io/tx/0x3dd33d5b15edfbf2c9b76386a9cd93b85811143e079d9aea48e8eb6158d9b33e  Following function was called on   `WEENUS` token's contract address with Link: https://ropsten.etherscan.io/address/0x101848D5C5bBca18E6b4431eEdF6B95E9ADF82FA#writeContract 
function name: `approve`
Arguments:
spender: `0xB65AAB0F0ad28Ab5A2b07a9fE9cDecb0F3cd740C`
tokens: `1000000000000000000`
* Calling `convertTokenToETH` function on smart contract with arguments as `cryptoToken` with address of WEENUS token: `0x101848D5C5bBca18E6b4431eEdF6B95E9ADF82FA` and `quantity` as `1000000000000000000`.  
Contract interaction: https://ropsten.etherscan.io/tx/0x0088be726253d8a4f6ff61a812c83bff3821aa31c2c0d91e897dd6bd37ede71a
* `WithdrawETH` function on block explorer: https://ropsten.etherscan.io/tx/0x20ab633e45b9db0b30a9ab551ae78588071aae06c9cb07ee63f93b26e2aa2919

