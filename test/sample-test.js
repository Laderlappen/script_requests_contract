const { expect } = require("chai");

// describe("Greeter", function () {
//   it("Should return the new greeting once it's changed", async function () {
//     const Greeter = await ethers.getContractFactory("Greeter");
//     const greeter = await Greeter.deploy("Hello, world!");
//     await greeter.deployed();

//     expect(await greeter.greet()).to.equal("Hello, world!");

//     const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

//     // wait until the transaction is mined
//     await setGreetingTx.wait();

//     console.log("HELOOOO");

//     expect(await greeter.greet()).to.equal("Hola, mundo!");
//   });

// });

describe("Queries", function () {
  it("Testing Queries", async function () {
    const Greeter = await ethers.getContractFactory("DashQueries");
    const greeter = await Greeter.deploy();
    await greeter.deployed();

    // // Gulper Profit
    // console.log("Profit");
    // const profit = await greeter.getTotalRaisedFromGulper(); // use bigint
    // console.log(parseFloat(profit));

    // // DEth Collateral
    // console.log("Collateral");
    // let a,b,c,d,e;
    // [a,b,c,d,e] = await greeter.getCollateralFromDEth(); // use bigint
    // console.log(parseFloat(a));
    // console.log(parseFloat(b));
    // console.log(parseFloat(c));
    // console.log(parseFloat(d));
    // console.log(parseFloat(e));

    // // DEth total supply
    // const supply = await greeter.getTotalSupplyFromDEth();
    // console.log(parseFloat(supply));

    // // Staking period finish
    // const periodFin = await greeter.getPeriodFinishFromStakingRewards();
    // console.log(parseFloat(periodFin));

    // // get Treasury Balances
    // let f, g, h;
    // [f, g, h] = await greeter.getTreasuryBalances();
    // console.log(parseFloat(f));
    // console.log(parseFloat(g));
    // console.log(parseFloat(h));

    // // get Balancer Balance
    // let balancerBalance;
    // balancerBalance = await greeter.getBalancerPoolFryBalance();
    // console.log(parseFloat(balancerBalance));

    // // permaFrost total supply
    // let totalSupply;
    // totalSupply = await greeter.getPermaFrostTotalSupply();
    // console.log(parseFloat(totalSupply));

    
    // // permaFrost locked
    // let locked;
    // locked = await greeter.getPermaFrostLockedTokenBalance();
    // console.log(parseFloat(locked));

    // // get Treasury Balances
    // let t1, t2, t3;
    // [t1, t2, t3] = await greeter.getTeamToastFryTokenBalance();
    // console.log(parseFloat(t1));
    // console.log(parseFloat(t2));
    // console.log(parseFloat(t3));

    // // getData from QueryStakingPool
    // let t1, t2, t3, t4, t5, t6, t7, t8;
    // [t1, t2, t3, t4, t5, t6, t7, t8] = await greeter.getDataFromQueryStakingPool("0x7E1d0353063F01CfFa92f4a9C8A100cFE37d8264");
    // console.log(parseFloat(t1));
    // console.log(parseFloat(t2));
    // console.log(parseFloat(t3));
    // console.log(parseFloat(t4));
    // console.log(parseFloat(t5));
    // console.log(parseFloat(t6));
    // console.log(parseFloat(t7));
    // console.log(parseFloat(t8));
    

    
    // ALL QUERIES
    let _periodFinish, _totalRaised, _totalSupply, _mainTAcc, _secondTAcc, _thirdTAcc, 
    _priceRAY, _totalCollateral, _debt, _collateralDenominatedDebt, _excessCollateral, 
    _availableBalance, _stakedBalance, _allowedBalance, _earned, _totalStakedValue, 
    _APY, _rewardRate, _timestamp;
    
    [_periodFinish, _totalRaised, _totalSupply, _mainTAcc, 
      _secondTAcc, _thirdTAcc, _priceRAY, _totalCollateral, 
      _debt, _collateralDenominatedDebt, _excessCollateral, _availableBalance, 
      _stakedBalance, _allowedBalance, _earned, _totalStakedValue, 
      _APY, _rewardRate, _timestamp] = await greeter.executeAllQueries("0x7E1d0353063F01CfFa92f4a9C8A100cFE37d8264");

    console.log("_periodFinish", parseFloat(_periodFinish));
    console.log("_totalRaised", parseFloat(_totalRaised));
    console.log("_totalSupply", parseFloat(_totalSupply));
    console.log("_mainTAcc", parseFloat(_mainTAcc));
    console.log("_secondTAcc", parseFloat(_secondTAcc));
    console.log("_thirdTAcc", parseFloat(_thirdTAcc));
    console.log("_priceRAY", parseFloat(_priceRAY));
    console.log("_totalCollateral", parseFloat(_totalCollateral));
    console.log("_debt", parseFloat(_debt));
    console.log("_collateralDenominatedDebt", parseFloat(_collateralDenominatedDebt));
    console.log("_excessCollateral", parseFloat(_excessCollateral));
    console.log("_availableBalance", parseFloat(_availableBalance));
    console.log("_stakedBalance", parseFloat(_stakedBalance));
    console.log("_allowedBalance", parseFloat(_allowedBalance));
    console.log("_earned", parseFloat(_earned));
    console.log("_totalStakedValue", parseFloat(_totalStakedValue));
    console.log("_APY", parseFloat(_APY));
    console.log("_rewardRate", parseFloat(_rewardRate));
    console.log("_timestamp", parseFloat(_timestamp));
  });

});

  
