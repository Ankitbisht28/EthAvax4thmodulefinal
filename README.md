# EthAvax4thmodulefinal

Degen Gaming ERC20 Token:-
This project deploys an ERC20 token on the Avalanche network for Degen Gaming. The smart contract provides various functionalities such as minting new tokens, transferring tokens, redeeming tokens for in-game store items, checking token balances, and burning tokens.

Smart Contract:-
The smart contract is implemented in the DegenToken.sol file. It extends the ERC20 and Ownable contracts from the OpenZeppelin library. Here's an overview of the contract's functions:

Minting new tokens:-
mint(address to, uint256 amount): Allows the owner of the contract to create and distribute new tokens to the specified address.

Transferring tokens:-

transferTokens(address receiver, uint256 value): Enables players to transfer their tokens to another address.

Redeeming tokens:-

redeemTokens(uint256 amount): Allows players to redeem their tokens for items in the in-game store. The logic for redeeming tokens for store items should be implemented within this function.

Checking token balance:-

checkBalance(): Enables players to check their token balance at any time.

Burning tokens:-

burnTokens(uint256 amount): Allows anyone to burn their own tokens that are no longer needed.

Deployment:-

To deploy the DegenToken contract on the Avalanche network, follow these steps:

Make sure you have the necessary dependencies installed by running npm install.
Set up your Avalanche network configurations in the hardhat.config.js file.
Customize the deploy.js file if necessary.
Run npx hardhat run deploy.js --network avalanche to deploy the contract.

Testing:-

The smart contract can be thoroughly tested to ensure its functionality. The tests should cover scenarios such as minting tokens, transferring tokens, redeeming tokens, checking token balances, and burning tokens. To run the tests, use the command npx hardhat test.

Verify the smart-contract on Snowtrace:-
by going to the site https://testnet.snowtrace.io/, and entering the owner address we can trace the transactions done.

License
This project is licensed under the MIT License. See the LICENSE file for more details.







