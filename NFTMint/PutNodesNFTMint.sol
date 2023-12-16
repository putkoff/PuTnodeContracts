//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
library SafeMath {
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

// OpenZeppelin Contracts v4.4.1 (utils/introspection/IERC165.sol)
pragma solidity ^0.8.0;

interface IERC165 {
    
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
// File @openzeppelin/contracts/utils/introspection/[email protected]
// OpenZeppelin Contracts v4.4.1 (utils/introspection/ERC165.sol)
pragma solidity ^0.8.0;

abstract contract ERC165 is IERC165 {
    
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}
// File @openzeppelin/contracts/utils/[email protected]
// OpenZeppelin Contracts (last updated v4.5.0) (utils/Address.sol)
pragma solidity ^0.8.1;

library Address {
    
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize/address.code.length, which returns 0
        // for contracts in construction, since the code is only stored at the end
        // of the constructor execution.
        return account.code.length > 0;
    }
    
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
    
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }
    
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }
    
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }
    
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResult(success, returndata, errorMessage);
    }
    
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }
    
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");
        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }
    
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }
    
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }
    
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}
// File @openzeppelin/contracts/utils/[email protected]
// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)
pragma solidity ^0.8.0;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}
// File @openzeppelin/contracts/utils/[email protected]
// OpenZeppelin Contracts v4.4.1 (utils/Strings.sol)
pragma solidity ^0.8.0;

library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";
    
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
    
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }
    
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}

// File @openzeppelin/contracts/access/[email protected]
// OpenZeppelin Contracts v4.4.1 (access/Ownable.sol)
pragma solidity ^0.8.0;

abstract contract Ownable is Context {
    address private _owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    constructor() {
        _transferOwnership(_msgSender());
    }
    
    function owner() public view virtual returns (address) {
        return _owner;
    }
    
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }
    
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }
    
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }
    
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}
// File @openzeppelin/contracts/token/ERC1155/[email protected]
// OpenZeppelin Contracts v4.4.1 (token/ERC1155/IERC1155.sol)
pragma solidity ^0.8.0;

interface IERC1155 is IERC165 {
    
    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);
    
    event TransferBatch(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256[] ids,
        uint256[] values
    );
    
    event ApprovalForAll(address indexed account, address indexed operator, bool approved);
    
    event URI(string value, uint256 indexed id);
    
    function balanceOf(address account, uint256 id) external view returns (uint256);
    
    function balanceOfBatch(address[] calldata accounts, uint256[] calldata ids)
        external
        view
        returns (uint256[] memory);
    
    function setApprovalForAll(address operator, bool approved) external;
    
    function isApprovedForAll(address account, address operator) external view returns (bool);
    
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) external;
    
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external;
}
// File @openzeppelin/contracts/token/ERC1155/[email protected]
// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC1155/IERC1155Receiver.sol)
pragma solidity ^0.8.0;

interface IERC1155Receiver is IERC165 {
    
    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    ) external returns (bytes4);
    
    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    ) external returns (bytes4);
}
// File @openzeppelin/contracts/token/ERC1155/extensions/[email protected]
// OpenZeppelin Contracts v4.4.1 (token/ERC1155/extensions/IERC1155MetadataURI.sol)
pragma solidity ^0.8.0;

interface IERC1155MetadataURI is IERC1155 {
    
    function uri(uint256 id) external view returns (string memory);
}
// File @openzeppelin/contracts/token/ERC1155/[email protected]
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC1155/ERC1155.sol)
pragma solidity ^0.8.0;
contract ERC1155 is Context, ERC165, IERC1155, IERC1155MetadataURI {
    using Address for address;
    // Mapping from token ID to account balances
    mapping(uint256 => mapping(address => uint256)) private _balances;
    // Mapping from account to operator approvals
    mapping(address => mapping(address => bool)) private _operatorApprovals;
    // Used as the URI for all token types by relying on ID substitution, e.g. https://token-cdn-domain/{id}.json
    string private _uri;
    
    constructor(string memory uri_) {
        _setURI(uri_);
    }
    
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return
            interfaceId == type(IERC1155).interfaceId ||
            interfaceId == type(IERC1155MetadataURI).interfaceId ||
            super.supportsInterface(interfaceId);
    }
    
    function uri(uint256) public view virtual override returns (string memory) {
        return _uri;
    }
    
    function balanceOf(address account, uint256 id) public view virtual override returns (uint256) {
        require(account != address(0), "ERC1155: balance query for the zero address");
        return _balances[id][account];
    }
    
    function balanceOfBatch(address[] memory accounts, uint256[] memory ids)
        public
        view
        virtual
        override
        returns (uint256[] memory)
    {
        require(accounts.length == ids.length, "ERC1155: accounts and ids length mismatch");
        uint256[] memory batchBalances = new uint256[](accounts.length);
        for (uint256 i = 0; i < accounts.length; ++i) {
            batchBalances[i] = balanceOf(accounts[i], ids[i]);
        }
        return batchBalances;
    }
    
    function setApprovalForAll(address operator, bool approved) public virtual override {
        _setApprovalForAll(_msgSender(), operator, approved);
    }
    
    function isApprovedForAll(address account, address operator) public view virtual override returns (bool) {
        return _operatorApprovals[account][operator];
    }
    
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public virtual override {
        require(
            from == _msgSender() || isApprovedForAll(from, _msgSender()),
            "ERC1155: caller is not owner nor approved"
        );
        _safeTransferFrom(from, to, id, amount, data);
    }
    
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) public virtual override {
        require(
            from == _msgSender() || isApprovedForAll(from, _msgSender()),
            "ERC1155: transfer caller is not owner nor approved"
        );
        _safeBatchTransferFrom(from, to, ids, amounts, data);
    }
    
    function _safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) internal virtual {
        require(to != address(0), "ERC1155: transfer to the zero address");
        address operator = _msgSender();
        uint256[] memory ids = _asSingletonArray(id);
        uint256[] memory amounts = _asSingletonArray(amount);
        _beforeTokenTransfer(operator, from, to, ids, amounts, data);
        uint256 fromBalance = _balances[id][from];
        require(fromBalance >= amount, "ERC1155: insufficient balance for transfer");
        unchecked {
            _balances[id][from] = fromBalance - amount;
        }
        _balances[id][to] += amount;
        emit TransferSingle(operator, from, to, id, amount);
        _afterTokenTransfer(operator, from, to, ids, amounts, data);
        _doSafeTransferAcceptanceCheck(operator, from, to, id, amount, data);
    }
    
    function _safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal virtual {
        require(ids.length == amounts.length, "ERC1155: ids and amounts length mismatch");
        require(to != address(0), "ERC1155: transfer to the zero address");
        address operator = _msgSender();
        _beforeTokenTransfer(operator, from, to, ids, amounts, data);
        for (uint256 i = 0; i < ids.length; ++i) {
            uint256 id = ids[i];
            uint256 amount = amounts[i];
            uint256 fromBalance = _balances[id][from];
            require(fromBalance >= amount, "ERC1155: insufficient balance for transfer");
            unchecked {
                _balances[id][from] = fromBalance - amount;
            }
            _balances[id][to] += amount;
        }
        emit TransferBatch(operator, from, to, ids, amounts);
        _afterTokenTransfer(operator, from, to, ids, amounts, data);
        _doSafeBatchTransferAcceptanceCheck(operator, from, to, ids, amounts, data);
    }
    
    function _setURI(string memory newuri) internal virtual {
        _uri = newuri;
    }
    
    function _mint(
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) internal virtual {
        require(to != address(0), "ERC1155: mint to the zero address");
        address operator = _msgSender();
        uint256[] memory ids = _asSingletonArray(id);
        uint256[] memory amounts = _asSingletonArray(amount);
        _beforeTokenTransfer(operator, address(0), to, ids, amounts, data);
        _balances[id][to] += amount;
        emit TransferSingle(operator, address(0), to, id, amount);
        _afterTokenTransfer(operator, address(0), to, ids, amounts, data);
        _doSafeTransferAcceptanceCheck(operator, address(0), to, id, amount, data);
    }
    
    function _mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal virtual {
        require(to != address(0), "ERC1155: mint to the zero address");
        require(ids.length == amounts.length, "ERC1155: ids and amounts length mismatch");
        address operator = _msgSender();
        _beforeTokenTransfer(operator, address(0), to, ids, amounts, data);
        for (uint256 i = 0; i < ids.length; i++) {
            _balances[ids[i]][to] += amounts[i];
        }
        emit TransferBatch(operator, address(0), to, ids, amounts);
        _afterTokenTransfer(operator, address(0), to, ids, amounts, data);
        _doSafeBatchTransferAcceptanceCheck(operator, address(0), to, ids, amounts, data);
    }
    
    function _burn(
        address from,
        uint256 id,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "ERC1155: burn from the zero address");
        address operator = _msgSender();
        uint256[] memory ids = _asSingletonArray(id);
        uint256[] memory amounts = _asSingletonArray(amount);
        _beforeTokenTransfer(operator, from, address(0), ids, amounts, "");
        uint256 fromBalance = _balances[id][from];
        require(fromBalance >= amount, "ERC1155: burn amount exceeds balance");
        unchecked {
            _balances[id][from] = fromBalance - amount;
        }
        emit TransferSingle(operator, from, address(0), id, amount);
        _afterTokenTransfer(operator, from, address(0), ids, amounts, "");
    }
    
    function _burnBatch(
        address from,
        uint256[] memory ids,
        uint256[] memory amounts
    ) internal virtual {
        require(from != address(0), "ERC1155: burn from the zero address");
        require(ids.length == amounts.length, "ERC1155: ids and amounts length mismatch");
        address operator = _msgSender();
        _beforeTokenTransfer(operator, from, address(0), ids, amounts, "");
        for (uint256 i = 0; i < ids.length; i++) {
            uint256 id = ids[i];
            uint256 amount = amounts[i];
            uint256 fromBalance = _balances[id][from];
            require(fromBalance >= amount, "ERC1155: burn amount exceeds balance");
            unchecked {
                _balances[id][from] = fromBalance - amount;
            }
        }
        emit TransferBatch(operator, from, address(0), ids, amounts);
        _afterTokenTransfer(operator, from, address(0), ids, amounts, "");
    }
    
    function _setApprovalForAll(
        address owner,
        address operator,
        bool approved
    ) internal virtual {
        require(owner != operator, "ERC1155: setting approval status for self");
        _operatorApprovals[owner][operator] = approved;
        emit ApprovalForAll(owner, operator, approved);
    }
    
    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal virtual {}
    
    function _afterTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal virtual {}
    function _doSafeTransferAcceptanceCheck(
        address operator,
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) private {
        if (to.isContract()) {
            try IERC1155Receiver(to).onERC1155Received(operator, from, id, amount, data) returns (bytes4 response) {
                if (response != IERC1155Receiver.onERC1155Received.selector) {
                    revert("ERC1155: ERC1155Receiver rejected tokens");
                }
            } catch Error(string memory reason) {
                revert(reason);
            } catch {
                revert("ERC1155: transfer to non ERC1155Receiver implementer");
            }
        }
    }
    function _doSafeBatchTransferAcceptanceCheck(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) private {
        if (to.isContract()) {
            try IERC1155Receiver(to).onERC1155BatchReceived(operator, from, ids, amounts, data) returns (
                bytes4 response
            ) {
                if (response != IERC1155Receiver.onERC1155BatchReceived.selector) {
                    revert("ERC1155: ERC1155Receiver rejected tokens");
                }
            } catch Error(string memory reason) {
                revert(reason);
            } catch {
                revert("ERC1155: transfer to non ERC1155Receiver implementer");
            }
        }
    }
    function _asSingletonArray(uint256 element) private pure returns (uint256[] memory) {
        uint256[] memory array = new uint256[](1);
        array[0] = element;
        return array;
    }
}
// File @openzeppelin/contracts/token/ERC1155/extensions/[email protected]
// OpenZeppelin Contracts v4.4.1 (token/ERC1155/extensions/ERC1155Burnable.sol)
pragma solidity ^0.8.0;
abstract contract ERC1155Burnable is ERC1155 {
    function burn(
        address account,
        uint256 id,
        uint256 value
    ) public virtual {
        require(
            account == _msgSender() || isApprovedForAll(account, _msgSender()),
            "ERC1155: caller is not owner nor approved"
        );
        _burn(account, id, value);
    }
    function burnBatch(
        address account,
        uint256[] memory ids,
        uint256[] memory values
    ) public virtual {
        require(
            account == _msgSender() || isApprovedForAll(account, _msgSender()),
            "ERC1155: caller is not owner nor approved"
        );
        _burnBatch(account, ids, values);
    }
}
// File @openzeppelin/contracts/token/ERC1155/extensions/[email protected]
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC1155/extensions/ERC1155Supply.sol)
pragma solidity ^0.8.0;

abstract contract ERC1155Supply is ERC1155 {
    mapping(uint256 => uint256) private _totalSupply;
    
    function totalSupply(uint256 id) public view virtual returns (uint256) {
        return _totalSupply[id];
    }
    
    function exists(uint256 id) public view virtual returns (bool) {
        return ERC1155Supply.totalSupply(id) > 0;
    }
    
    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal virtual override {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
        if (from == address(0)) {
            for (uint256 i = 0; i < ids.length; ++i) {
                _totalSupply[ids[i]] += amounts[i];
            }
        }
        if (to == address(0)) {
            for (uint256 i = 0; i < ids.length; ++i) {
                uint256 id = ids[i];
                uint256 amount = amounts[i];
                uint256 supply = _totalSupply[id];
                require(supply >= amount, "ERC1155: burn amount exceeds totalSupply");
                unchecked {
                    _totalSupply[id] = supply - amount;
                }
            }
        }
    }
}
pragma solidity ^0.8.4;
contract PutNodeNFT is ERC1155, Ownable, ERC1155Burnable, ERC1155Supply {
    using SafeMath for uint256;
    uint256 public constant RedGiant = 1;
    uint256 public constant WhiteDwarf = 2;
    uint256 public constant SuperNova = 3;
    uint256 public Zero = 0;
    string public name;
    string public symbol;
    string public uri_RedGiant;
    string public uri_WhiteDwarf;
    string public uri_SuperNova;
    string[] public NFTURIs;
    uint256[] public NFTids;
    uint256 public redgiant;
    uint256 public whitedwarf;
    uint256 public supernova;
    address public token;
    uint256 public strange;
    string[] public uri_ls = ["https://bafybeigx4nhmkybcnrnkgyuyrnzv536l4wop2rknyxhelq357qrc57oqii.ipfs.nftstorage.link/1.json","https://bafybeiefohsdkww5tvpj7bfjasuoznnig5xbouhsnaoz2mgzvoqi2lnjai.ipfs.nftstorage.link/2.json","https://bafybeigmuj6hxvou4rmjuho2yg2gga6l4rcfesvprgzvogchogpg4apdf4.ipfs.nftstorage.link/3.json"];
    
    modifier managerOnly() {require(isInList(msg.sender, Managers)== true); _;}
    modifier onlyGuard() {require(owner() == _msgSender() || token == _msgSender(), "NOT_GUARD");_;}
    address[] private Managers;
    constructor() ERC1155(uri_ls[0]) {
	name = "ProtoStarsNFT";
	symbol = "PRONFT";
	uri_RedGiant = uri_ls[0];
	uri_WhiteDwarf = uri_ls[1];
	uri_SuperNova = uri_ls[2];
	NFTids = [RedGiant,WhiteDwarf,SuperNova];
	NFTURIs = [uri_RedGiant,uri_WhiteDwarf,uri_SuperNova];
	Managers.push(owner());

    }
    function isInList(address _account, address[] memory list) internal returns(bool){
    	for(uint i=0;i<list.length;i++){
    		if(_account == list[i]){
    			return true;
    		}
    	}
    	return false;
    }
    function checkTots() external view returns(uint256[3] memory){
    	return [redgiant,whitedwarf,supernova];
    }
    function setURI(uint256 k) public onlyOwner {
        require(k > 0 && k < 4,"thats not in the stars");
		_setURI(uri_ls[k-1]);
    }
    function PsetURI(uint256 k) public onlyGuard {
        require(k > 0 && k < 4,"thats not in the stars");
		_setURI(uri_ls[k-1]);
    }
    function recTotes(uint256 _id, uint256 _amount) internal {
    	uint256[3] memory ls = [Zero,Zero,Zero];
    	for(uint i=0;i<ls.length;i++){
		if(i == _id-1){
			ls[i] = _amount;
		}
		    	
    	}
    	redgiant += ls[0];
    	whitedwarf += ls[1];
    	supernova += ls[2];
    }
    function idToSet(address _to,uint256 _id,uint256 _amount,bytes memory data) internal returns(address,uint256,uint256,bytes memory) {
    	uint _k = _id.sub(1);
	_setURI(NFTURIs[_k]);
	recTotes(NFTids[_k],_amount);
	return (_to,NFTids[_k],_amount,data);
    }
    function Pmint(address _account, uint256 _id, uint256 _amount, bytes memory data) public onlyGuard{
    	    idToSet(_account,_id,_amount,data);
    }
    function mint(address _account, uint256 _id, uint256 _amount, bytes memory data)public onlyOwner{
    	   idToSet(_account,_id,_amount,data);
    	    _mint(_account,_id,_amount,data);
    }
    function mintBatch(address _to, uint256[] memory _ids, uint256[] memory _amounts, bytes memory data) external managerOnly{	
    	for(uint i=0;i<_ids.length;i++){
    		(address _account, uint256 _id, uint256 _amount, bytes memory data) = idToSet(_to,_ids[i],_amounts[i],data);
	    	mint(_account,_id,_amount,data);
    	} 
    }
    // The following functions are overrides required by Solidity.
    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) internal override(ERC1155, ERC1155Supply) {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
    fallback() external payable {}
    // Function to receive Ether. msg.data must be empty
    receive() external payable {}
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }    
    function updateToken(address newToken) external managerOnly {
        token = newToken;
    }
    function updateManager(address man) external onlyOwner {
        Managers.push(man);
    }
}
