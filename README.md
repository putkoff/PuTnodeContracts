# PutNodes Ecosystem - [Smart Contract Documentation](https://github.com/putkoff/PutNodes/tree/maindocumentation)

## Comprehensive Overview

Welcome to the definitive guide for the PutNodes ecosystem - a sophisticated network of interconnected smart contracts engineered for decentralized environments. This [README.md](https://github.com/putkoff/PutNodes/tree/mainREADME) offers an in-depth exploration of each smart contract within the ecosystem, highlighting their individual functions and the intricate relationships they share. 

---

### Key Contract: [PutNodesProtoManager](https://github.com/putkoff/PutNodes/tree/mainProtoManager)

#### Core Functionality
The PutNodesProtoManager contract is the regulatory backbone of the PutNodes ecosystem, integral to its operations. It incorporates various abstract contracts, including [Context](https://github.com/putkoff/PutNodes/tree/mainContext), [boostManager](https://github.com/putkoff/PutNodes/tree/mainboostManager), [feeManager](https://github.com/putkoff/PutNodes/tree/mainfeeManager), and [prevProtoStarManager](https://github.com/putkoff/PutNodes/tree/mainprevProtoStarManager). These contracts encompass critical functions, ensuring the ecosystem runs smoothly.

#### Node Lifecycle and Security
The contract oversees node naming, creation, and lifecycle management. A unique feature is the tracking of node collapse in a 'deadstars' array, enhancing transparency and reliability. Token transaction facilities are tightly controlled, accessible only by the contract owner, thus fortifying security and operational flexibility. Furthermore, the contract's adaptability to changes within the ecosystem (e.g., treasury, fee manager) highlights its resilience and capacity for growth.

---

### In-Depth Look at the PutNodes Ecosystem's Contracts

#### [PutNodesFeeManager Contract](https://github.com/putkoff/PutNodes/tree/mainFeeManager)
##### Overview
The PutNodesFeeManager contract orchestrates fee management, dealing with a range of fees from various ecosystem participants. It facilitates the transfer and allocation of fees in AVAX and ERC-20 tokens and emphasizes transparency with features like reconciliation and fee calculations.

##### Functionality and Security
This contract plays a vital role in NFT management, adding new protos, altering existing data, and overseeing their lifecycles. Its security is bolstered by restricted operations, accessible only to specific addresses like 'owner,' 'manager,' or 'guard.'

##### Ecosystem Role
The FeeManager smart contract is central in overseeing financial aspects, addressing issues like insolvency and collapse of NFTs. It provides detailed insights into each NFT's status and ensures transparent tracking of various statistics.

#### [PutNodesBoostManager Contract](https://github.com/putkoff/PutNodes/tree/mainBoostManager)
##### Structure
The PutNodesBoostManager introduces a 'boost' functionality, accelerating dividend payouts. It is structured with internal data types like PROTOstars and DEADStars and leverages multiple contracts and libraries for functionality inheritance.

##### Security and Interaction
Security is paramount, with access restrictions like 'managerOnly' and 'onlyGuard'. This contract integrates seamlessly with other ecosystem components, enhancing the holistic nature of the smart contracts.

#### [nft_stake Contract](https://github.com/putkoff/PutNodes/tree/mainnft_stake)
##### Features
The nft_stake contract is crucial for the staking mechanism in the ecosystem. It allows for staking at three levels, with specific mapping data structures for each.

##### Security Focus
Operations such as contract address updates are exclusively owner-executable, enhancing security. The contract also implements the [ERC1155Receiver](https://github.com/putkoff/PutNodes/tree/mainERC1155Receiver) function for secure token transfers.

#### [PutNodesNftMint Contract](https://github.com/putkoff/PutNodes/tree/mainNftMint)
##### Contract Mechanics
This contract is pivotal in NFT lifecycle management, handling minting and distribution. It sets essential parameters like NFT address, costs, and supply limits.

##### Security Aspects
Key functions, including manager updates and fund transfers, are owner-restricted, ensuring controlled access to critical operations.

#### [PutNodes Overseer Contract](https://github.com/putkoff/PutNodes/tree/mainOverseer)
##### Functionality
The Overseer Contract acts as an oracle and quality assurance system, not directly interacting with the core ecosystem but playing a vital role in verifying various components. 

##### Security and Adaptability
It inherits from 'Ownable' and 'Authorizable' contracts for controlled access and manages essential ecosystem components like the treasury address and rewards wallet.

---

### Mathematical and Utility Libraries in the PutNodes Ecosystem

#### [PutNodesMath Library](https://github.com/putkoff/PutNodes/tree/mainMathLibrary)
Ensures safe mathematical operations, preventing arithmetic overflows or underflows. It leverages 'unchecked' blocks and 'SafeMath' library functions for reliable and efficient calculations.

#### [PutMath Library](https://github.com/putkoff/PutNodes/tree/mainPutMath)
Provides core mathematical and list management utilities. It is categorized into List Check, Mathematical Functions, and Utility Functions, each serving specific ecosystem needs.

#### [boostLib](https://github.com/putkoff/PutNodes/tree/mainboostLib)
Central to the 'Boost' feature, boostLib uses SafeMath for secure operations. It includes functions like 'calcReward' and 'doPercentage' for dynamic reward computations and percentage calculations.

---

### Conclusion

The PutNodes ecosystem represents a meticulously crafted network of smart contracts, each contributing uniquely to the overall functionality and security of the system. Regular audits and quality checks are recommended to ensure ongoing reliability and efficiency. This comprehensive documentation aims to provide a clear understanding of each component's role, functionality, and the synergy that binds them into a cohesive and robust ecosystem.

---

## [License](https://github.com/putkoff/PutNodes/tree/mainLICENSE)

The PutNodes ecosystem is licensed under [MIT License](https://github.com/putkoff/PutNodes/tree/mainLICENSE).

