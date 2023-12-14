/**
 *Submitted for verification at snowtrace.io on 2022-08-30
*/
/**
 *Submitted for verification at snowtrace.io on 2022-08-30
*/
//SPDX-License-Identifier: UNLICENSED
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
library boostLib {
    using SafeMath for uint256;
    function calcReward(uint256 _dailyRewardsPerc,uint256 _timeStep,uint256 _timestamp, uint256 _lastClaimTime, uint256 _boost_) internal pure returns (uint256,uint256){
            uint256 _one_ = 1;
            uint256 one = _one_*(10**18)/1440;
	    uint256 elapsed = _timestamp - _lastClaimTime;
	    uint256 _rewardsPerDay = doPercentage(one, _dailyRewardsPerc);
	    (uint256 _rewardsTMul,uint256 _dayMultiple1) = getMultiple(elapsed,_timeStep,_rewardsPerDay);
	    uint256[2] memory _rewards_ = addFee(_rewardsTMul,_boost_);
	    uint256 _rewards = _rewards_[0];
	    uint256 _boost = _rewards_[1];
    	    uint256 _all  = _rewards+_boost;
    	    return (_all,_boost);
    	   }
    function doPercentage(uint256 x, uint256 y) internal pure returns (uint256) {
    	uint256 xx = 0;
   	if (y !=0){
   		xx = x.div((10000)/(y)).mul(100);
   	}
    	return xx;
    }
    function addFee(uint256 x,uint256 y) internal pure returns (uint256[2] memory) {
        (uint256 w, uint256 y_2) = getMultiple(y,100,x);
    	return [w,doPercentage(x,y_2)];
    }
    function getMultiple(uint256 x,uint256 y,uint256 z) internal pure returns (uint,uint256) {
    	uint i = 0;
    	uint256 w = z;
    	while(x > y){
    		i++;
    		x = x - y;
    		z += w;
    	}
    	return (z,x);
    }
    function isInList(address x, address[] memory y) internal pure returns (bool){
    	for (uint i =0; i < y.length; i++) {
            if (y[i] == x){
                return true;
            }
    	}
    	return false;
    }
}
library nebuLib {
	using SafeMath for uint256;
		function addressInList(address[] memory _list, address _account) internal pure returns (bool){
			for(uint i=0;i<_list.length;i++){
				if(_account == _list[i]){
					return true;
				}
			}
			return false;
		}
		function mainBalance(address _account) internal view returns (uint256){
			uint256 _balance = _account.balance;
			return _balance;
		}
		function getAllMultiple(uint256 _x,uint256 _y)internal pure returns(uint256,uint256){
			uint256 Zero = 0;
			if (_y == Zero || _x == Zero || _x > _y){
				return (Zero,_y);
			}
			uint256 z = _y;
			uint256 i = 0;
			while(z >= _x){
				i++;
				z -=_x;
			}
			return (i,z);
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
		function timeMultiple(uint256 _x,uint256 _y)internal pure returns(uint256){
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
		function doAllMultiple(uint256 _x,uint256 _y,uint256 _z) internal pure returns(uint256,uint256,uint256,uint256){
		//doAllMultiple(uint256 _x,uint256 _y,uint256 _z) (MAXinterval,total,fee)
			uint256 Zero = 0;
			if (_y == Zero || _x == Zero || _x > _y){
				return (_x,Zero,Zero,_y);
			}
			uint256 i = 0;
			uint256 _k = _y;
			uint256 One = 1;
			uint256 _w = 0;
			while(_y >= _z && _x!=0){
				i++;
				_k -= _z;
				_w += _y;
				_x-=One;
			}
			return (_x,i,_w,_k);//(multiplierRemainder,multiplier,newtotal,remainder)
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
		function safeDivs(uint256 _x,uint256 _y) internal view returns(uint256){
			uint256 refDecOne = getDecimals(_x);
			uint256 refDecTwo = getDecimals(_y);
			uint256 newRef = _x*(10**refDecTwo);
			uint256 newDiv = newRef/_y;
			return newDiv;
		}
		function doPercentage(uint256 _x,uint256 perc) internal view returns(uint256[3] memory){
			uint256 exp = getDecimals(_x);
			uint256 percDec = getDecimals(perc);
			uint denom =  20-percDec;
			uint trunc = elimZero(perc);
			uint[3] memory range = [exp,denom,trunc];
			uint256 _y = _x.mul(10**range[1]);
			uint256 _z = _y.mul(perc);
			return [range[0],_z.div(10**denom),_z];
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
		function mainBalance(address _account) internal view returns (uint256){
			uint256 _balance = _account.balance;
			return _balance;
		}
}
// File: @openzeppelin/contracts/utils/Context.sol
// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}
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
abstract contract feeManager is Context {
    function isInsolvent(address _account,string memory _name) external virtual view returns(bool);
    function createProtos(address _account,string memory _name) external virtual;
    function collapseProto(address _account,string memory _name) external virtual;
    function payFee() payable virtual external;
    function changeName(string memory _name,string memory new_name) external virtual;
    function viewFeeInfo(address _account,string memory _name) external virtual view returns(uint256,uint256,bool,bool,bool,bool);
    function getPeriodInfo() external  virtual returns (uint256,uint256,uint256);
    function getAccountsLength() external virtual view returns(uint256);
    function accountExists(address _account) external virtual view returns (bool);
    }
abstract contract prevPutNodeProtoManager is Context {
    function getDeadStarsData(address _account, uint256 _x) external  virtual returns(string memory,uint256,uint256,uint256,uint256,uint256,uint256,bool,bool);
    function protoAccountData(address _account, uint256 _x) external virtual returns(string memory,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256);
    function protoAccountExists(address _account) external virtual returns (bool);
    function getCollapseDate(address _account,uint256 _x) external virtual view returns(uint256);
    function getdeadStarsLength(address _account) external virtual view returns(uint256);
    function getProtoAccountsLength() external virtual view returns(uint256);
    function getProtoAddress(uint256 _x) external virtual view returns(address);
    function getProtoStarsLength(address _account) external virtual view returns(uint256);
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
contract PutNodesBoostManager is Ownable {
    string public constant name = "NebulaProtoStarManager";
    string public constant symbol = "PMGR";
    using SafeMath for uint256;
    using SafeMath for uint;
    struct PROTOstars {
	string name;
	uint256 creationTime;
	uint256 lastClaimTime;
	uint256 protoElapsed;
	uint256 protoLife;
	uint256 lifeDecrease;
	uint256 collapseDate;
	bool insolvent;
    }
    struct DEADStars {
	string name;
	uint256 creationTime;
	uint256 lastClaimTime;
	uint256 protoElapsed;
	uint256 collapseDate;
	bool insolvent;
	bool imploded;
    	}
    struct PENDING{
    	uint256 calcTime;
    	uint256 boostRewardsMin;
    	uint256 lifeDecrease;
    	uint256 rewards;
	uint256 tempBoost;
	uint256 tempTotRewards;
	uint256 elapsed;
	uint256 boostElapsed;
    }
    struct TIMES {
	uint256 boostRewardsMin;
	uint256 rewardsMin;
	uint256 timeBoost;
	uint256 timeRegular;
	uint256 cashoutFeeRegular;
	uint256 cashoutFee;
	uint256 lifeDecrease;
	uint256 tempRewards;
	uint256 tempBoost;
	uint256 tempTotRewards;
    }
    mapping(address => PROTOstars[]) public protostars;
    mapping(address => DEADStars[]) public deadstars;
    mapping(address => TIMES[]) public nftTimes;
    mapping(address => PENDING[]) public pending;
    address[] public PROTOaccounts;
    address[] public PROTOtransfered;
    address[] public Managers;
    uint256[] public nftsHeld;
    uint256 public Zero = 0;
    uint256 public one = 1;
    uint256 public gas = 1*(10**17);
    uint256 public protoLife = 500 days;
    uint256 public claimFee;
    uint256 public rewardsPerMin;
    uint256[] public boostmultiplier;
    uint256[] public boostRewardsPerMin;
    uint256[] public cashoutRed;
    uint256[] public times;
    address Guard;
    bool public fees = false;
    overseer public over;
    feeManager public feeMGR;
    address public nftAddress;
    address payable public treasury;
    modifier managerOnly() {require(nebuLib.addressInList(Managers,msg.sender)== true); _;}
    modifier onlyGuard() {require(owner() == _msgSender() || Guard == _msgSender() || nebuLib.addressInList(Managers,_msgSender()) == true, "NOT_proto_GUARD");_;}
    constructor(address overseer_ ,address _feeManager, address payable _treasury ) {
    	over = overseer(overseer_);
	treasury = _treasury;
	feeMGR = feeManager(_feeManager);
	Managers.push(owner());
	rewardsPerMin = over.getRewardsPerMin();
	for(uint i=0;i<4;i++){
		boostmultiplier.push(over.getMultiplier(i));
		rewardsperMin = over.getRewardsPerMin;
		boostRewardsPerMin.push(boostRewardsPerMin(i));
		cashoutRed.push(over.getCashoutRed(i));
	}
    }
   function getTimes(address _account, uint256 _time, uint256 _id,uint256 calcTime,uint _x) internal returns (uint256,uint256){
   	uint256 nfTtime = over.getNftTimes(_account,_id,i);
   	uint256 elapsed = _time.sub(calcTime);
   	if(isLower(calcTime,nfTtime)==true){
   		uint256 nftElapsed = (nfTtime).sub(calcTime);
   		uint256 regElapsed = elapsed.sub(nftElapsed);
   		uint256 boostedElapsed = nebuLib.doPercentage(nftElapsed,boostmultiplier[i]);
   		uint256 totalElapsed = claimElapsed.add(boostElapsed);
   	        uint256 rewards = totalElapsed.mul(rewardsperMin);
   	        nftTimes[_account][_x].rewards = rewards;
   	        uint256 boostRewards = nebuLib.doPercentage(nftElapsed,boostRewardsPerMin[i]);
   	        uint256  totalRewards = rewards.add(boostRewards);
   	        pending[_account][_x].nftelapsed += nftElapsed;
	   	pending[_account][_x].boostElapsed += boostedElapsed;
	   	pending[_account][_x].boostedElapsed += totalElapsed;
	   	pending[_account][_x].boostRewards += boostRewards;
	   	pending[_account][_x].totalRewards = totalRewards;
   	}else{
   		uint256 nftElapsed = elapsed;
   	        uint256 boostedElapsed = nebuLib.doPercentage(nftElapsed,boostmultiplier[i]);
   		uint256 boostRewards = nebuLib.doPercentage(nftElapsed,boostRewardsPerMin[i]);
   		uint256 totalElapsed = claimElapsed.add(boostElapsed);
   		uint256 totalRewards = rewards.add(boostRewards);
   		pending[_account][_x].nftelapsed += nftElapsed;
	   	pending[_account][_x].boostElapsed += boostedElapsed;
	   	pending[_account][_x].boostedElapsed += totalElapsed;
	   	pending[_account][_x].boostRewards += boostRewards;
	   	pending[_account][_x].totalRewards = totalRewards;
   	}
   	}
   function queryBoost(address _account,uint256 _x) internal{
   	uint256 _time = block.timeStamp;
   	uint256 lastClaim = protostars[_account][_x].lastClaimTime;
   	uint256 calcTime = nftTimes[_account][count].calcTime;
   	uint256 allCount;
   	uint256 totalRew;
   	uint256 boostmul;
   	uint256 nftAmt;
   	if (over.isStaked(_account)==true){
	   	doPercentage(_x,perc);
	   	boostmul = boostmultiplier(_x);
	   	for(uint j=0;j<3;j++){
	   		_id = j;
	   		nftAmt = over.getNftAmount(_account,_id);
		   	for(uint i=0;i<nftAmt;i++){
		   		for(uint k=0;k<5;k++){
		   			getTimes(_account,_time,_id,k,calcTime,count);
	   				allCount +=1;
	   			}
	   		}
	   	}
	}
	uint256 totalElapsed;
	uint256 rewards;
	for(uint _x= allCount;_X<protos.length;_X++){
		totalElapsed = _time.sub(calcTime);
		rewards = totalElapsed.mul(rewardsperMin);
		pending[_account][_x].totalElapsed += totalElapsed;
		pending[_account][_x].rewards += rewards;
		pending[_account][_x].totalRewards += totalRewards;
	}
	pending[_account][count].calcTime = _time;
    }
    function claimBoost(address _account,uint256 _x) external{
    	queryBoost(_account);
    	nftTimes[_account][_x].lastClaimTime = pending[_account][count].calcTime;
    	uint256 totalRew;
	for(uint _x=0;_x<	protos.length;_X++){
		nftTimes[_account][_x].nftelapsed += pending[_account][_x].nftelapsed;
	   	nftTimes[_account][_x].boostElapsed += pending[_account][_x].boostElapsed;
	   	nftTimes[_account][_x].boostedElapsed += pending[_account][_x].boostedElapsed;
	   	nftTimes[_account][_x].boostRewards += pending[_account][_x].boostRewards;
	   	nftTimes[_account][_x].totalRewards = pending[_account][_x].totalRewards;
	   	nftTimes[_account][_x].totalElapsed += pending[_account][_x].totalElapsed;
		nftTimes[_account][_x].rewards += pending[_account][_x].rewards;
		nftTimes[_account][_x].totalRewards += pending[_account][_x].totalRewards;
		totalRew += pending[_account][_x].totalRewards;
	}
	ZeroPending(_account);
	totalRew;
   }
   function recProtoRewards(address _account) external onlyGuard{
   	PROTOstars[] storage stars = protostars[_account];
   	TIMES[] storage times = nftTimes[_account];
   	for(uint i=0;i<stars.length;i++){
	   	PROTOstars storage star = stars[i];
	   	TIMES storage time = times[i];
	   	star.lastClaimTime = star.lastClaimTime;
	   	star.protoElapsed =star.lastClaimTime - star.creationTime;
	   	star.rewards += time.tempRewards;
	   	star.lifeDecrease += time.lifeDecrease;
	   	star.boost += time.tempBoost;
	   	star.collapseDate = star.protoLife - star.lifeDecrease - star.protoElapsed;
  	}
  }
   function addProto(address _account, string memory _name) external onlyGuard  {
   	require(bytes(_name).length > 3 && bytes(_name).length < 32,"the Node name must be within 3 and 32 characters");
   	require(nameExists(_account,_name) == false,"name has already been used");
       	if (nebuLib.addressInList(PROTOaccounts,_account) == false){
	    	PROTOaccounts.push(_account);
	    }
    	PROTOstars[] storage protos = protostars[_account];
	uint256 _time = block.timestamp;
	uint256 collapse = _time.add(protoLife);
	protos.push(PROTOstars({
		name:_name,
		creationTime:_time,
		lastClaimTime:_time,
		protoElapsed:Zero,
		protoLife:protoLife,
		collapseDate:collapse,
		insolvent:false
	}));
	}
    function nameExists(address _account, string memory _name) internal view returns(bool){
    		PROTOstars[] storage protos = protostars[_account];
    	    	for(uint i = 0;i<protos.length;i++) {
    			PROTOstars storage proto = protos[i];
    			string memory name = proto.name;
    			if(keccak256(bytes(name)) == keccak256(bytes(_name))){
    				return true;
    			}
    		}
    		return false;
    }
    function findFromName(address _account, string memory _name) internal view returns(uint256){
    	    	PROTOstars[] storage protos = protostars[_account];
    	    	for(uint i = 0;i<protos.length;i++) {
    			PROTOstars storage proto = protos[i];
    			if(keccak256(bytes(proto.name)) == keccak256(bytes(_name))){
    				return i;
    			}
    		}
    }
    function changeFeeManager(address _address) external onlyGuard {
        address _feeManager = _address;
    	feeMGR = feeManager(_feeManager);
    }
    function changeName(string memory _name,string memory new_name) external {
    	address _account = msg.sender;
    	require(nameExists(_account,_name) == true,"name does not exists");
    	require(nebuLib.addressInList(PROTOaccounts,_account) == true,"you do not hold any Protostars Currently");
    	PROTOstars[] storage protos = protostars[_account];
    	PROTOstars storage proto = protos[findFromName(_account,_name)];
    	proto.name = new_name;
    	feeMGR.changeName(_name,new_name);
    }
    function getDeadStarsData(address _account, uint256 _x) external onlyGuard() returns(string memory,uint256,uint256,uint256,uint256,uint256,bool,bool){
    		DEADStars[] storage deads = deadstars[_account];
    		DEADStars storage dead = deads[_x];
    		return (dead.name,dead.creationTime,dead.lastClaimTime,dead.rewards,dead.boost,dead.collapseDate,dead.insolvent,dead.imploded);
    }
    function protoAccountData(address _account, uint256 _x) external onlyGuard() returns(string memory,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256){
    		PROTOstars[] storage stars = protostars[_account];
    		PROTOstars storage star = stars[_x];
    		return (star.name,star.creationTime,star.lastClaimTime,star.protoElapsed,star.rewards,star.boost,star.protoLife,star.lifeDecrease,star.collapseDate);
    	}
   function protoAccountExists(address _account) external returns (bool) {
    	return nebuLib.addressInList(PROTOaccounts,_account);
    }
    function getCollapseDate(address _account,string memory _name) external view returns(uint256) {
       		PROTOstars[] storage stars = protostars[_account];
    		PROTOstars storage star = stars[findFromName(_account,_name)];
    		return star.collapseDate;
    }
    function getdeadStarsLength(address _account) external view returns(uint256){
    		DEADStars[] storage deads = deadstars[_account];
        	return deads.length;
    }
    function getProtoAccountsLength() external view returns(uint256){
    	return PROTOaccounts.length;
    }
    function getProtoAddress(uint256 _x) external view returns(address){
    	return PROTOaccounts[_x];
    }
    function getProtoStarsLength(address _account) external view returns(uint256){
    	PROTOstars[] storage stars = protostars[_account];
    	return stars.length;
    }
    function updateTreasury(address payable _treasury) external onlyOwner() {
    	treasury = _treasury;
    }
    function updateFeeManager(address _feeManager) external onlyGuard(){
    		feeMGR = feeManager(_feeManager);
    }
    function updateRewardsPerMin() external onlyGuard() {
    	rewardsPerMin = over.getRewardsPerMin();
	for(uint i=0;i<3;i++){
		boostRewardsPerMin[i] = over.getBoostPerMin(i);
	}
    }
    function updateGuard(address newVal) external onlyOwner {
        Guard = newVal; //token swap address
    }
    function updateManagers(address newVal) external onlyOwner {
    	if(nebuLib.addressInList(Managers,newVal) ==false){
        	Managers.push(newVal); //token swap address
        }
    }
}

