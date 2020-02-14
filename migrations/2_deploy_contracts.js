const ConvertLib = artifacts.require("ConvertLib");
const MetaCoin = artifacts.require("MetaCoin");
const FeesLib = artifacts.require("FeesLib");
const ERC20Token = artifacts.require("ERC20Token");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.deploy(FeesLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.link(FeesLib, MetaCoin);
  deployer.deploy(MetaCoin);
  deployer.link(ConvertLib, ERC20Token);
  deployer.link(FeesLib, ERC20Token);
  deployer.deploy(ERC20Token);
};
