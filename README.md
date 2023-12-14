# PuTnodes Ecosystem - Smart Contract Documentation

## Overview
The PuTnodes ecosystem is a robust framework of interconnected smart contracts designed to operate within a decentralized network. This document provides an exhaustive overview of each smart contract involved in the PuTnodes ecosystem, detailing their functionalities and interrelationships.

---

### 1. PuTnodesFrontEnd
**Main Contract**
- **Functionality**: Serves as the central hub for all interactions and logic execution within the PuTnodes ecosystem.

---

### 2. DropManager.sol and Update DropManager.sol
**Drop Management Contracts**
- **Purpose**: Manage and execute 'drops' (rewards) within the ecosystem.
- **Functions**: Scheduling, allocation, and operational tasks related to node rewards.

---

### 3. PuTnodesBoostManager.sol
**Node Boost Management Contract**
- **Responsibilities**: Manages node boosts based on tiers.
- **Key Features**: Defines boost amounts for different node tiers.

---

### 4. PuTnodesFeeManager.sol
**Transaction Fee Management Contract**
- **Function**: Handles calculation and subtraction of transaction fees within the ecosystem.

---

### 5. PuTnodesManager.sol
**Node Management Contract**
- **Functionality**: Oversees the creation, updating, and removal of nodes in the ecosystem.

---

### 6. PuTnodesMath.sol and PuTnodesMathLib.sol
**Utility Contracts**
- **Purpose**: Provide mathematical functions and operations for safer execution in other contracts.

---

### 7. PuTnodesNFTStake.sol
**NFT Staking Contract**
- **Responsibilities**: Manages staking and releasing of NFTs within the ecosystem.

---

### 8. PuTnodesUpdateManager.sol
**Ecosystem State Management Contract**
- **Role**: Ensures stability and correctness of operations across the ecosystem.

---

### 9. PuTprotoStarManager
**ProtoStar Lifecycle Management Contract**
- **Main Functions**:
  - `addProto(...)`: Creates new protoStars.
  - `collapseProto(...)`: Collapses existing protoStars.
  - `protoAccountData(...)`: Provides data on individual protoStars.
  - `getDeadStarsData(...)`: Retrieves data on deadStars.
  - `updatePuTToken(...)` and other update functions: Keeps addresses within the contract current.

---

### 10. Detailed Contract Functionality
**DropManager Specific Functions**
- **Key Operations**: Managing pre-release rewards, claim mechanisms, and updating system components.
- **Functions Include**: `getPendingRewards`, `claimRewards`, `updateDailyRewards`, and more.

---

### Additional Contracts and Libraries
**SafeMath, PuTLib, boostLib**
- **SafeMath**: Ensures safe mathematical operations, preventing overflows/underflows.
- **PuTLib**: Offers utility functions for the ecosystem.
- **boostLib**: Related to reward and fee calculations.

---

### Conclusion
This README aims to provide a comprehensive guide to the smart contracts within the PuTnodes ecosystem. Each contract plays a pivotal role in maintaining the functionality and stability of the network. For more detailed implementation and usage, refer to the specific contract documentation.
