// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Greeter = await hre.ethers.getContractFactory("Greeter");
  const greeter = await Greeter.deploy("Hello, Hardhat!");
  await greeter.deployed();
  console.log("Greeter deployed to:", greeter.address);

  console.log("Changing greeting");
  await greeter.setGreeting("Zdravo, Graditelju!");
  console.log("Greeting changed!");

  const Queries = await hre.ethers.getContractFactory("DashQueries");
  const queries = await Queries.deploy();
  await queries.deployed();
  console.log("Queries deployed to:", queries.address);

  let _periodFinish, _totalRaised, _totalSupply, _mainTAcc, _secondTAcc, _thirdTAcc, 
    _priceRAY, _totalCollateral, _debt, _collateralDenominatedDebt, _excessCollateral, 
    _availableBalance, _stakedBalance, _allowedBalance, _earned, _totalStakedValue, 
    _APY, _rewardRate, _timestamp;
    
    [_periodFinish, _totalRaised, _totalSupply, _mainTAcc, 
      _secondTAcc, _thirdTAcc, _priceRAY, _totalCollateral, 
      _debt, _collateralDenominatedDebt, _excessCollateral, _availableBalance, 
      _stakedBalance, _allowedBalance, _earned, _totalStakedValue, 
      _APY, _rewardRate, _timestamp] = await queries.executeAllQueries("0x7E1d0353063F01CfFa92f4a9C8A100cFE37d8264");
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
