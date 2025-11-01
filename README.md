Blockchain e-Voting dApp

This is a mini-project demonstrating a decentralized application (dApp) for an electronic voting system. It is built on the Ethereum blockchain (using the Sepolia testnet) and provides a secure, transparent, and immutable way to conduct a simple election.

The backend logic is controlled by a Solidity smart contract, and the frontend is a simple static webpage that allows users to interact with the contract via MetaMask.

Core Features

Secure & Transparent: All votes are recorded as transactions on the Sepolia testnet, making them publicly verifiable and tamper-proof.

Access Control: The system is managed by an "Admin" (the contract owner) who is the only one who can add candidates and register voters.

Voter Registration: Only whitelisted Ethereum addresses (registered by the Admin) are eligible to cast a vote.

One Person, One Vote: The smart contract strictly enforces that a registered address can only vote one time.

Real-time Results: The dApp frontend automatically loads the list of candidates and their current vote counts from the blockchain.

Technology Stack

Smart Contract: Solidity

Blockchain: Ethereum (Sepolia Testnet)

Frontend: HTML, Tailwind CSS

Wallet & Blockchain Interaction: MetaMask, ethers.js

Hosting: Deployed on Vercel

How to Use This dApp

To use this deployed e-Voting dApp, you will need a web browser with the MetaMask extension installed.

1. Configure MetaMask

Install MetaMask: If you don't have it, install the MetaMask browser extension.

Connect to Sepolia: You must switch your MetaMask network to the Sepolia Testnet. The smart contract is only deployed on this network.

Get Test ETH: You will need a small amount of SepoliaETH to pay for the gas fees (transactions). You can get this for free from a "Sepolia faucet" (e.g., sepoliafaucet.com).

2. How to Vote (as a Voter)

Get Registered: Contact the dApp Administrator (the person who deployed the contract) and give them your public 0x... wallet address. They must register you first.

Visit the dApp URL: Open the Vercel link for this project.

Connect Wallet: Click "Connect Wallet" on the top right.

View Candidates: Once your wallet is connected, the page will load all available candidates.

Cast Your Vote: If your address has been registered by the Admin, the "Vote" buttons will be blue and clickable.

Click the "Vote" button for your chosen candidate.

MetaMask will pop up asking you to confirm the transaction. This will cost a very small gas fee.

Click "Confirm".

Verify: After the transaction is confirmed, the page will update. Your role will change to "Registered Voter (Voted)", and the vote count for your candidate will increase.

3. How to Manage (as the Admin)

Log in: Connect to the dApp using the same wallet address that was used to deploy the smart contract.

View Admin Panel: The dApp will automatically recognize you as the "Admin / Owner" and the Admin Panel will appear.

Add Candidates: Type a candidate's name and click "Add". Confirm the transaction in MetaMask.

Register Voters: Copy a user's 0x... wallet address, paste it into the "Register Voter" field, and click "Register". Confirm the transaction in MetaMask.
