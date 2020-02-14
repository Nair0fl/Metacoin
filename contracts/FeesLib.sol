pragma solidity >=0.4.25 <0.7.0;

library FeesLib{

	function convert(uint amount,uint feesRate) public pure returns (uint feesAmount)
	{
		return amount / feesRate;
	}
}
