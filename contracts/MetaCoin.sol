pragma solidity >=0.4.25 <0.7.0;

import "./FeesLib.sol";
import "./ConvertLib.sol";

contract MetaCoin {
	mapping (address => uint) balances;
    mapping (address => mapping (address => uint256)) allowed;
	uint256 public totalSupply;
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function approve(address _spender, uint256 _value) public returns (bool success)  {
		allowed[msg.sender][_spender] = _value;
        return true;
	}

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
		return allowed[_owner][_spender];
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		//100 pour prendre 1% de la transaction
		uint fees = FeesLib.convert(amount,100);
		balances[msg.sender] -= (amount+fees);
		balances[receiver] = balances[receiver] + (amount-fees);
		return true;
	}

	function getBalanceInEth(address addr) public view returns(uint){
		return ConvertLib.convert(getBalance(addr),2);
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}