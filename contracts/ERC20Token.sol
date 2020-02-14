pragma solidity >=0.4.25 <0.7.0;

import "./Metacoin.sol";

contract ERC20Token is MetaCoin {


    string public name;
    uint8 public decimals;
    string public symbol;
    string public version = 'v1.0';


    constructor() public{
        balances[msg.sender] = 999;
        totalSupply = 100000;
        name = "MyYnovCoin";
        decimals = 0;
        symbol = "MYC";
    }

	function approveAndCall(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        return true;
    }
}