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
