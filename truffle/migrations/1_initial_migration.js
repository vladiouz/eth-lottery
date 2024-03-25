var Ownable = artifacts.require("./Ownable.sol");
var Lottery = artifacts.require("./Lottery.sol");

module.exports = function (deployer) {
  deployer.deploy(Ownable);
  deployer.deploy(Lottery);
};
