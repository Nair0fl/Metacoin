pragma solidity >=0.4.25 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ERC20Token.sol";

contract TestMetaCoin {

  function testInitialBalanceUsingDeployedContract() public {
    ERC20Token meta = ERC20Token(DeployedAddresses.ERC20Token());

    uint expected = 999;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }


}
