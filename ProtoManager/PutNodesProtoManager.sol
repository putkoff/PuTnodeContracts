// SPDX-License-Identifier: (Unlicense)
// File: @openzeppelin/contracts/utils/math/SafeMath.sol
// OpenZeppelin Contracts v4.4.1 (utils/math/SafeMath.sol)
pragma solidity ^0.8.0;
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
library PutLib {
	using SafeMath for uint256;
		function addressInList(address[] memory _list, address _account) internal pure returns (bool){
			for(uint i=0;i<_list.length;i++){
				if(_account == _list[i]){
					return true;
				}
			}
			return false;
		}
		function getAllMultiple(uint256 _x,uint256 _y)internal pure returns(uint256,uint256){
			uint256 Zero = 0;
			if (_y == Zero || _x == Zero || _x > _y){
				return (Zero,_y);
			}
			uint256 z = _y;
			uint256 i = 0;
			while(z >= _x){
				
				z -=_x;
				i++;
							
			}
			return (i,z);
		}
		function getDecimals(uint256 _x) internal view returns(uint){
			uint i = 0;
			while(_x != 0){
				_x = _x.div(10);
				i++;
			}
			return i;
		}
		function elimZero(uint256 _y) internal view returns(uint256){
			uint i = getDecimals(_y);
			uint dec = i;
			uint refDec = i;
			uint _n = 0;
			uint k = 0;
			while(_n ==0 && refDec!=0){
				refDec -= 1;
				_n = _y.div(10**refDec);
				k +=1;
			}
			return k;
		}
		function sendPercentage(uint256 _x,uint256 perc) internal view returns(uint256){
			uint256 exp = getDecimals(_x);
			uint256 percDec = getDecimals(perc);
			uint denom =  21-percDec;
			uint trunc = elimZero(perc);
			uint[3] memory range = [exp,denom,trunc];
			uint256 _y = _x.mul(10**range[1]);
			uint256 _z = _y.mul(perc);
			return _z.div(10**(denom+percDec));
			
		}
		function getRemainder(uint256 _x,uint256 _y)internal pure returns(uint256){
			(uint256 mult,uint256 rem) =  getAllMultiple(_x,_y);
			return rem;
		}
		function getMultiple(uint256 _x,uint256 _y)internal pure returns(uint256){
			(uint256 mult,uint256 rem) = getAllMultiple(_x,_y);
			return mult;
		}
		function doMultiple(uint256 _x,uint256 _y)internal pure returns(uint256){
			uint256 Zero = 0;
			if (_y == Zero || _x == Zero || _x > _y){
				return Zero;
			}
			uint256 _z = _y;
			uint256 One = 1;
			while(_x > One){
				_z += _y;
				_x.sub(One); 		
			}
			return _z;
		}
		function findInList(address[] memory _ls,address _account) internal pure returns(uint){
			for(uint i = 0;i<_ls.length;i++){
				if(_ls[i] == _account){
					return i;
				}
			}
		}
		function isLower(uint256 _x,uint256 _y) internal pure returns(bool){
			if(_x<_y){
				return true;
			}
			return false;
		}
		function isHigher(uint256 _x,uint256 _y) internal pure returns(bool){
			if(_x>_y){
				return true;
			}
			return false;
		}
		function isEqual(uint256 _x,uint256 _y) internal pure returns(bool){
			if(isLower(_x,_y)==false && isHigher(_x,_y) ==false){
				return true;
			}
			return false;
		}
		function getLower(uint256 _x,uint256 _y) internal pure returns(uint256){
			if(isEqual(_x,_y)==true || isLower(_x,_y) == true){
				return _x;
			}
			return _y;
		}
		function getHigher(uint256 _x,uint256 _y) internal pure returns(uint256){
			if(isEqual(_x,_y)==true || isHigher(_x,_y) == true){
				return _x;
			}
			return _y;
		}
}
pragma solidity ^0.8.0;
library Address {
    
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
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
pragma solidity ^0.8.0;
interface INodeManager {
    function checkInsolvent(address _account) external returns (uint256);
    function doPayments(address _account,uint256 payments) external;
    function doFuturePayments(address _account,uint256 payments) external;
    function queryFuturePayment(address _account) external view returns (uint);
    function queryDuePayment(address _account) external view returns (uint);
    function getBoostList(uint256[3] memory tiers) external view returns(uint256[100] memory);
    function getNodesAmount(address _account) external view returns (uint256,uint256);
    function getNodesRewards(address _account, uint256 _time, uint256 k,uint _tier,uint256 _timeBoost) external view returns (uint256);
    function cashoutNodeReward(address _account, uint256 _time, uint256 k) external;
    function cashoutAllNodesRewards(address _account) external;
    function createNode(address _account, string memory nodeName) external;
    function getNodesNames(address _account) external view returns (string memory);
}
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol
// OpenZeppelin Contracts v4.4.1 (token/ERC20/IERC20.sol)
pragma solidity ^0.8.0;
interface IERC20 {
    
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
// File: @openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol
// OpenZeppelin Contracts v4.4.1 (token/ERC20/utils/SafeERC20.sol)
pragma solidity ^0.8.0;
library SafeERC20 {
    using Address for address;
    function safeTransfer(
        IERC20 token,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }
    function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }
    function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }
    function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender) + value;
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }
    function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        unchecked {
            uint256 oldAllowance = token.allowance(address(this), spender);
            require(oldAllowance >= value, "SafeERC20: decreased allowance below zero");
            uint256 newAllowance = oldAllowance - value;
            _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
        }
    }
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.
        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) {
            // Return data is optional
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}
// File: @openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol
// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/IERC20Metadata.sol)
pragma solidity ^0.8.0;
interface IERC20Metadata is IERC20 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}
// File: @openzeppelin/contracts/utils/Context.sol
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
// File: @openzeppelin/contracts/token/ERC20/ERC20.sol
// OpenZeppelin Contracts v4.4.1 (token/ERC20/ERC20.sol)
pragma solidity ^0.8.0;
contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }
    function name() public view virtual override returns (string memory) {
        return _name;
    }
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
            // Overflow not possible: the sum of all balances is capped by totalSupply, and the sum is preserved by
            // decrementing then incrementing.
            _balances[to] += amount;
        }

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);
    }
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        unchecked {
            // Overflow not possible: balance + amount is at most totalSupply + amount, which is checked above.
            _balances[account] += amount;
        }
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
            // Overflow not possible: amount <= accountBalance <= totalSupply.
            _totalSupply -= amount;
        }

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
    function _spendAllowance(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}
// File: @openzeppelin/contracts/access/Ownable.sol
// OpenZeppelin Contracts v4.4.1 (access/Ownable.sol)
pragma solidity ^0.8.0;
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor() {
        _transferOwnership(_msgSender());
    }
    modifier onlyOwner() {
        _checkOwner();
        _;
    }
    function owner() public view virtual returns (address) {
        return _owner;
    }
    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
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



interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);
    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);
    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);
    function createPair(address tokenA, address tokenB) external returns (address pair);
    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}
pragma solidity >=0.6.2;
interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

pragma solidity ^0.8.0;
// OpenZeppelin Contracts (last updated v4.7.0) (token/ERC165/IERC165.sol)
interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
// OpenZeppelin Contracts (last updated v4.7.0) (token/ERC721/IERC721.sol)
pragma solidity ^0.8.0;
interface IERC721 is IERC165 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    function balanceOf(address owner) external view returns (uint256 balance);
    function ownerOf(uint256 tokenId) external view returns (address owner);
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;
    function approve(address to, uint256 tokenId) external;
    function setApprovalForAll(address operator, bool _approved) external;
    function getApproved(uint256 tokenId) external view returns (address operator);
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}
library myLib {
   using SafeMath for uint256;
    function getBoostList(uint256[3] memory tiers,uint256[3] memory _boostMultiplier) internal pure returns (uint256[100] memory){
    	uint256[100] memory tier_ls;
    	for(uint i=0;i<100;i++){
    		tier_ls[i] = 0;
    	}
    	uint j;
    	for(uint i=0;i<tiers.length;i++){
    		tiers[i].mul(5);
    		uint j_st = j + tiers[i];
    		for(uint j=j;j<j_st;j++){
    			tier_ls[j] = _boostMultiplier[i];
    		}
    	}
    	return tier_ls;
    }
   function doPercentage(uint256 x, uint256 y) internal pure returns (uint256) {
   	uint256 xx = x.div((10000)/(y*100));
    	return xx;
   }
   function takeFee(uint256 x, uint256 y) internal pure returns (uint256[2] memory) {
    	uint256 fee = doPercentage(x,y);
    	uint256 newOg = x.sub(fee);
    	return [newOg,fee];
   }
   function isInList(address[6] memory _list ,address[2] memory _accounts) internal pure returns(bool) {
    	for(uint j=0;j < _accounts.length;j++){
	   	for(uint i=0;i < _list.length;i++){
	   		if (_accounts[j] == _list[i]){
	   			return true;
	   		}
	   	}
		return false;
   	} 
    }
}
library txnTokenLib {
	
	function isInList(address[] memory _list ,address _account) internal pure returns(bool) {
		   for(uint i=0;i < _list.length;i++){
		   	if (_account == _list[i]){
		   		return true;
		   	}
		   }
		return false;
	   	} 
	    
}
abstract contract boostManager is Context {
	function getIncreasedDecay(address _account,uint256 _x) external virtual returns(uint256);
	function updateName(address _account,string memory _Oldname,string memory _newName) external virtual;
	function addProto(address _account, string memory _name) external virtual;
	function collapseProto(address _account, string memory _name) external virtual;
}
abstract contract feeManager is Context {
	function collapseProto(address _account,string memory _name) external virtual;
	function addProto(address _account,string memory _name) external virtual;
	function getTotalfees(address _account,uint256 _x) external virtual returns(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256);
	function getProtoowners(address _account,uint256 _x) external virtual returns(string memory,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256);
	function getProtoownersAccountsLength() external virtual returns(uint256);
	function getProtoAddress(uint256 _x) external virtual returns(address);
	function getBool(address _account,uint256 _x) external virtual returns(bool,bool,bool,bool);
	function getProtoownersLength(address _account) external virtual view returns(uint256);
	function getProtoIncreasedDecay(address _account,uint256 _x) external virtual view returns(uint256);
	function getBoolInsolvent(address _account,uint256 _x) external virtual view returns(bool);
	function getBoolImploded(address _account,uint256 _x) external virtual view returns(bool);
	function getBoolCollapsed(address _account,uint256 _x) external virtual view returns(bool);
	function updateName(address _account,string memory _Oldname,string memory _newName) external virtual;
    }
abstract contract overseer is Context {
	 function getMultiplier(uint256 _x) external virtual returns(uint256);
	 function getBoostPerMin(uint256 _x) external virtual view returns(uint256);
	 function getRewardsPerMin() external virtual view returns (uint256);
	 function getCashoutRed(uint256 _x) external virtual view returns (uint256);
	 function getNftTimes(address _account, uint256 _id,uint256 _x) external virtual view returns(uint256);
	 function isStaked(address _account) internal virtual returns(bool);
	 function getNftAmount(address _account, uint256 _id) external view virtual returns(uint256);
	 function getFee() external virtual view returns(uint256);
	 function getModFee(uint256 _val) external virtual view returns(uint256);
	 function getNftPrice(uint _val) external virtual view returns(uint256);
	 function getEm() external virtual view returns (uint256);
} 
abstract contract nft_stake is Context {
	function get_stake(address _account) external view virtual returns(uint256[3] memory);
	function get_times(address _account,uint256 i,uint256 k) external view virtual returns(uint256);
}
abstract contract protoManager is Context{
	function collapseProto(address _account, uint256 _x,bool _bool) external virtual;
	function addProto(address _account,string memory _name) external virtual;
}
pragma solidity ^0.8.0;
contract ProtoManager is ERC20, Ownable {
    using SafeMath for uint256;
    address public PutPair;
    address public OverSeerProtocol;
    address _overseer;
    nft_stake _overseer_ =  nft_stake(_overseer);
    address public feeToken;
    IERC20 _feeToken = IERC20(feeToken);
    address public  _nodeManager;
    INodeManager nodeManager = INodeManager(_nodeManager);
    uint256[] public fees;
    uint256 public teamPoolFee;
    uint256 public rewardsFee;
    uint256 public treasuryFee;
    uint256 public transferFee;

    uint256 public liquidityPoolFee;
    uint256 public cashoutFee;
    address public rewardsPool;
    address public treasury;
    address public teamPool;


    uint256 public rwSwap = 10;
    address public _protoManager;
    address public _dropManager;
    address public Guard;
    uint256 public _nodeAmount = 10;
    uint256 public cashoutPerc = 50;
    uint256 public nodeAmount = _nodeAmount*(10**18);
    uint256 public _feeAmount = 15;
    uint256 public feeAmount = _feeAmount*(10**18);
    uint256 public _totalSupply_ = 12000000;
    uint256 public _totalSupply =  _totalSupply_*(10**18);
    uint256[3] public boostmul = [25,50,75];
    address[6] public _pools;
    uint public Zero = 0;
    uint256[] rndm_ls2;
    uint i;
    uint j;
    address public pair;
    uint256 public totalClaimed = 0;
    //bools
    bool public isTradingEnabled = true;
    bool public swapLiquifyEnabled = true;
    bool private swapping = false;
    //interfaces
    IERC20 feeTok;
    overseer over;
    protoManager protoMGR;
    feeManager feeMGR;
    boostManager boostMGR;
    IUniswapV2Router02 private NeFiRouter;
    struct AllFees {
    		   uint256 nodes;
    		   uint256 rewards;
    		   uint256 team;
    		   uint256 treasury;
    		   uint256 OverSeerProtocol;
    		   uint256 nft;
    		   uint256 transfer;
    		   uint256 _boost;
    		   uint256 cashout;
    		   uint256 nodeFees;
    		   }
     struct TXNs { uint256 reward;
    		   uint256 team;
    		   uint256 treasury;
    		   uint256 nodeFees;
    		   uint256 OverSeerProtocol;
    		   }
    //mapping
    mapping(address => AllFees) public allFees;
    mapping(address => bool) public isBlacklisted;
    mapping(address => TXNs) public TXns;
    address[] public alls;

    //events
    event UpdateNeFiRouter(
        address indexed newAddress,
        address indexed oldAddress
    );
    event SetAutomatedMarketMakerPair(address indexed pair, bool indexed value);
    event Cashout(
        address indexed account,
        uint256 amount,
        uint256 indexed blockTime
    );
    modifier onlyGuard() {require(Guard == _msgSender() || _msgSender() == owner() || _msgSender() == _protoManager || _msgSender() == _dropManager, "feeMGR_NOT_GUARD");_;}
    constructor(address PutRouterAddress,address[] memory pools,uint256[] memory fees,uint256 Supply)ERC20("ProtoManager", "PROTO") {
        IUniswapV2Router02 _NeFiRouter = IUniswapV2Router02(PutRouterAddress);
        teamPoolFee = fees[0];
        rewardsFee = fees[1];
        treasuryFee = fees[2];
        transferFee = fees[3];

        cashoutFee = fees[5];
        rewardsPool = pools[0];
        treasury = pools[1];
        teamPool = pools[2];
        OverSeerProtocol = pools[3];
        PutPair = IUniswapV2Factory(_NeFiRouter.factory()).createPair(address(this),_NeFiRouter.WETH());
        NeFiRouter = _NeFiRouter;
        _pools = [rewardsPool,treasury,teamPool,OverSeerProtocol,PutPair,address(this)];
    }
//LogFees-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    function logFees(uint256 _rewardsPoolFee, uint256 _TreasuryFee, uint256 _teamFee, uint256 _OverSeerProtocolFee, uint256 _transferFee, uint256 _NFTFee,uint256 _cashoutFee, uint256 _nodeFees, address _account, uint256 _rewards) private{
	        AllFees storage all = allFees[_account];
	        TXNs storage txn = TXns[address(this)];
		rndm_ls2 = [_rewardsPoolFee,_TreasuryFee,_teamFee,_OverSeerProtocolFee,_transferFee,_NFTFee,_cashoutFee,_nodeFees];
    		all.rewards += rndm_ls2[0];
    		allFees[_account].treasury += rndm_ls2[1];
    		allFees[_account].team += rndm_ls2[2];
    		allFees[_account].OverSeerProtocol += rndm_ls2[3];
    		allFees[_account].transfer += rndm_ls2[4];
    		allFees[_account].nft += rndm_ls2[5];
    		allFees[_account].cashout += rndm_ls2[6];
    		allFees[_account].nodeFees += rndm_ls2[7];
		txn.reward += rndm_ls2[0];
		txn.treasury += rndm_ls2[1];
		txn.team += rndm_ls2[2];
		txn.OverSeerProtocol += rndm_ls2[3];
		txn.nodeFees += rndm_ls2[7];
    }  
//CashoutFees-------------------------------------------------------------------------------------------------------------------- 
   function cashoutAll() external {
        address sender = msg.sender;
        nodeManager.checkInsolvent(sender);
        uint256 rewards;
        uint256[3] memory Tiers =  _overseer_.get_stake(sender);
        (uint256 length,uint256 time) = nodeManager.getNodesAmount(sender);
        uint256 _cashoutFee = cashoutFee;
        if (Tiers[1] > 0) {
        	_cashoutFee = myLib.doPercentage(cashoutFee,50);
        }
        uint256 allcount;
        for(i=0;i<Tiers.length;i++){
        	for(j=0;j<Tiers[i];j++){
        		uint256 count = 0;
        		uint256 _time = _overseer_.get_times(msg.sender,i,j);
        		while (count < 5) {
        			rewards += nodeManager.getNodesRewards(msg.sender,time,i,boostmul[i],_time);
        			count++;
        			allcount++;
        		}
        	}
        }
        for(i=allcount;i<length;i++){ 
        	rewards += nodeManager.getNodesRewards(msg.sender,time,i,0,0);
        }
        require(rewards > 0, "you have no rewards to cash out");
        uint256[2] memory rew  = myLib.takeFee(rewards,_cashoutFee);
        Send_it(rewardsPool, sender, rew[0]);
        logFees(Zero,Zero,Zero,Zero,Zero,Zero,Zero,rew[1],msg.sender,rew[0]);
        for(i=0;i<length;i++){
        	nodeManager.cashoutNodeReward(msg.sender,time,i);
        }
        totalClaimed += rew[0];
        emit Cashout(sender, rew[0], 0);
    }
//SendTXNS-------------------------------------------------------------------------------------------------------------------------
   function SendFeeToken(address _account, address _destination, uint256 tokens) private {
   	if (checkTxn(_account,_destination,queryERC20Balance(_account),tokens) == true) {
    		_feeToken.approve(_account,tokens);
    		_feeToken.transferFrom(_account,_destination,tokens);
   	}
   }
   function Send_it(address _account, address _destination, uint256 tokens) private {
   	if (checkTxn(_account,_destination,balanceOf(_account),tokens) == true) {
    		super._transfer(_account, payable(_destination), tokens);
   	}
   }
   function _transfer(address sender,address to,uint256 amount) internal override {
        if (myLib.isInList(_pools,[sender,to]) == false) {
            	uint256[2] memory take = myLib.takeFee(amount,transferFee);
		Send_it(sender, address(this), take[1]);
		amount = take[0];
        }
	Send_it(sender, to, amount);
	
  }
//TXNChecks------------------------------------------------------------------------------------------------------------------------
    function queryERC20Balance(address _account) internal view returns (uint) {
        return IERC20(_feeToken).balanceOf(_account);
    }
    function checkInsolvent(address _account) internal {
    	uint256 remains = nodeManager.checkInsolvent(_account);
    	Send_it(_pools[0],_account,remains);
    }
    function checkTxn(address sender, address to,uint256 _balance, uint256 tokens) internal view returns(bool){
		require(!isBlacklisted[sender], "sender is blacklisted");
		require(!isBlacklisted[to]," reciever is BLACKLISTED");
		require(sender != address(0),"the sender is burn address");
		require(to != address(0), "the reciever is burn address");
		if (tokens !=0 && _balance >= tokens) {
			return true;
		}
	return false;
    }
//NodeInfo-------------------------------------------------------------------------------------------------------------------
    function updateNodeAmount(uint256 newVal) external onlyOwner {
        nodeAmount = newVal; //amount to putchase node
        nodeAmount = nodeAmount*(10**18);
    }
    function createNodeWithTokens(string memory name) external {
    	address sender = msg.sender;
    	require(bytes(name).length > 3 && bytes(name).length < 32,"the name needs to be between 3 and 32 characters");
    	checkTxn(sender,address(this),balanceOf(sender),nodeAmount);
        Send_it(sender,address(this),nodeAmount);
        uint256[4] memory _fees = [PutLib.sendPercentage(nodeAmount,treasuryFee),PutLib.sendPercentage(nodeAmount,treasuryFee),PutLib.sendPercentage(nodeAmount,teamPoolFee),nodeAmount];
      	for(uint i=0;i<_fees.length;i++){
        	checkTxn(address(this),_pools[i],balanceOf(address(this)),_fees[i]);
        	if (i != _fees.length){
        		_fees[3] -= _fees[i];
        	}
        }
        for(uint i=0;i<_fees.length;i++){
        	Send_it(address(this),_pools[i],_fees[i]);
        }
        logFees(_fees[0],_fees[1],_fees[2],_fees[3],Zero,Zero,Zero,Zero,sender,Zero);
        nodeManager.createNode(sender, name);
        AllFees storage all = allFees[sender];
        all.nodes += 1;
    }
//updatePairInfo-------------------------------------------------------------------------------------------------------------
    function updatePutRouterAddress(address newAddress) external onlyOwner {
        require(newAddress != address(NeFiRouter),"TKN:1");
        emit UpdateNeFiRouter(newAddress, address(NeFiRouter));
        IUniswapV2Router02 _NeFiRouter = IUniswapV2Router02(newAddress);
        address _PutPair = IUniswapV2Factory(NeFiRouter.factory()).createPair(address(this),_NeFiRouter.WETH());
        PutPair = _PutPair;
        PutRouterAddress = newAddress;
    }
    function updatePutPair(address payable newVal) external onlyOwner {
        PutPair = newVal; // team pool address
    }
//setFees-------------------------------------------------------------------------------------------------------------
    function updateRewardsFee(uint newVal) external onlyOwner {
        rewardsFee = newVal; //fee.div(100)
    }
    function updateTeamFee(uint256 newVal) external onlyOwner {
        teamPoolFee = newVal; //fee.div(100)
    }
    function updateTreasuryFee(uint256 newVal) external onlyOwner {
        treasuryFee = newVal; //fee.div(100)
    }
    function updateCashoutFee(uint256 newVal) external onlyOwner {
        cashoutFee = newVal;  //fee.div(100)
    }
    function updateTransferFee(uint256 newVal) external onlyOwner {
        cashoutFee = newVal;  //fee.div(100)
    }
    function migrate(address[] memory addresses_, uint256[] memory balances_) external onlyOwner {
        for(i = 0; i < addresses_.length; i++) {
            _mint(addresses_[i], balances_[i]);
        }
    }
    function burn(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }
    function blacklistAddress(address account, bool value)
        external
        onlyOwner
    {
        isBlacklisted[account] = value;
    }
//changeWallets-----------------------------------------------------------------------------------------------
    
   
    function updateFeeToken(address _account) external onlyGuard(){
    	INTupdateFeeToken(_account);
    }
    function INTupdateFeeToken(address _account) internal{
    	feeToken = _account;
    	feeTok = IERC20(feeToken); 
    }
    function updateOverseer(address _account) external onlyGuard(){
    	INTupdateOverseer(_account);
    }
    function INTupdateOverseer(address _account) internal{
    	_overseer = _account;
    	over = overseer(_overseer); 
    }
    function updateProtoManager(address _account) external onlyGuard(){
    	INTupdateProtoManager(_account);
    }
    function INTupdateProtoManager(address _account) internal{
    	_protoManager = _account;
    	protoMGR = protoManager(_protoManager); 
    }
    function updateFeeManager(address _account) external onlyGuard(){
    	INTupdateFeeManager(_account);
    }
    function INTupdateFeeManager(address _account) internal{
    	address _feeManager = _account;
    	feeMGR = feeManager(_feeManager); 
    }
    function updateBoostManager(address _account) external onlyGuard(){
    	INTupdateBoostManager(_account);
    }
    function INTupdateBoostManager(address _account) internal{
    	address _boostManager = _account;
    	boostMGR = boostManager(_boostManager); 
    }
    function updateTreasury(address payable _account) external onlyGuard(){
    	INTupdateTreasury(_account);
    }
    function INTupdateTreasury(address payable _account) internal{
    	treasury = _account; 
    }
    function updateTeamPool(address _account) external onlyGuard(){
    	INTupdateTeamPool(_account);
    }
    function INTupdateTeamPool(address _account) internal{
        	teamPool = _account;
        }
    function updateRewardsPool(address _account) external onlyGuard(){
    	INTupdateRewardsPool(_account);
    }
    function INTupdateRewardsPool(address _account) internal{
        	rewardsPool = _account;
        }
    function updateGuard(address newVal) external onlyOwner(){
        Guard = newVal; //token swap address
    }
//payments-----------------------------------------------------------------------------------------

    function MakeAllFeePayment() external{
        address sender = msg.sender;
        checkInsolvent(sender);
        uint256 balance = IERC20(_feeToken).balanceOf(sender);
        require(feeAmount <= balance,"you dont have enough tokens to pay the minimum required allotment");
    	uint256 payments = nodeManager.queryDuePayment(sender);
    	uint256 _fees;
    	
    	for(uint i=0;i<payments;i++){
    		if (balance >= feeAmount){
	    		_fees += feeAmount;
	    		balance -= feeAmount;
	    		SendFeeToken(sender,address(this),feeAmount);
	    		logFees(Zero,Zero,Zero,Zero,Zero,Zero,Zero,feeAmount,sender,Zero);
	    		nodeManager.doFuturePayments(sender,1);
    		}
    	}
    }
    
    
    function MakeAllFuturePayments() external{
        address sender = msg.sender;
        checkInsolvent(sender);
        uint256 balance = IERC20(_feeToken).balanceOf(sender);
        require(feeAmount <= balance,"you dont have enough tokens to pay the minimum required allotment");
    	uint256 payments = nodeManager.queryFuturePayment(sender);
    	uint256 _fees;
    	for(uint i=0;i<payments;i++){
    		if (balance >= feeAmount){
    			_fees += feeAmount;
    			balance -= feeAmount;
    			SendFeeToken(sender,address(this),feeAmount);
    			logFees(Zero,Zero,Zero,Zero,Zero,Zero,Zero,feeAmount,sender,Zero);
    			nodeManager.doFuturePayments(sender,1);
    		}
    	}
    	
    }
    function payInPieces(uint256 _payments) external {
    	address sender = msg.sender;
    	uint256 count;
    	uint256 total;
    	uint256 due = nodeManager.queryDuePayment(sender);
    	uint256 future = nodeManager.queryFuturePayment(sender);
    	uint256 low = _payments;
    	checkInsolvent(sender);
    	if ((future+due) < _payments) {
    		low = future+due;
    	}
    	for(uint i=0;i<low;i++){
    		total += feeAmount;
    	}
    	require(total <= queryERC20Balance(sender),"you need to select less payment, you dont have enough tokens to pay");
    	require(total > 0, "you are all paid up");
    	for(uint i=0;i<_payments;i++){
    		if(due > 0){
    			SendFeeToken(sender,address(this),feeAmount);
    			logFees(Zero,Zero,Zero,Zero,Zero,Zero,Zero,feeAmount,sender,Zero);
    			nodeManager.doPayments(sender,1);
    			due -= 1;

    		}
    		else if(future > 0){
    		    	SendFeeToken(sender,address(this),feeAmount);
    		    	logFees(Zero,Zero,Zero,Zero,Zero,Zero,Zero,feeAmount,sender,Zero);
    			nodeManager.doFuturePayments(sender,1);
    			future -= 1;
    			
    		}	
    	}
    	
   }	
//Overflow-----------------------------------------------------------------------------------------
    function transferOut(address payable _to,uint256 _amount) payable external  onlyOwner(){
		_to.transfer(_amount);
	}
    function transferAllOut(address payable _to,uint256 _amount) payable external onlyOwner(){
		_to.transfer(address(this).balance);
	}
    function sendAllTokenOut(address payable _to,address _token) external onlyOwner(){
		IERC20 newtok = IERC20(_token);
		newtok.transferFrom(address(this), _to, newtok.balanceOf(address(this)));
	}

}
