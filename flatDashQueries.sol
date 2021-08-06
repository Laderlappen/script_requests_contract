// Sources flattened with hardhat v2.5.0 https://hardhat.org

// File @openzeppelin/contracts/token/ERC20/IERC20.sol@v4.2.0

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


// File contracts/DashQueries.sol

//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IQueryStakingPool
{
    function getData(
            address _rewards,
            address _staker)
        external
        view
        returns (
            uint _availableBalance,
            uint _stakedBalance,
            uint _allowedBalance,
            uint _earned,
            uint _totalStakedValue,
            uint _APY,
            uint _rewardRate,
            uint _timestamp); // rewards per second    
}

interface IGulper 
{
    function totalRaised() 
        external 
        view 
        returns (uint);
}

interface IdEth 
{
    function getCollateral()
        external
        view
        returns(
            uint _priceRAY, 
            uint _totalCollateral, 
            uint _debt, 
            uint _collateralDenominatedDebt, 
            uint _excessCollateral);
    
    function totalSupply() 
        external 
        view 
        returns (uint256);
}

interface IStakingRewards 
{
    function periodFinish() 
        external 
        view 
        returns (uint256);
}

contract DashQueries 
{
    IGulper glpr;
    IdEth deth;
    IStakingRewards stakingRewards;
    IQueryStakingPool queryStakingPool;

    address constant public ethContractAddress = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant public mainTreasuryAddress = 0x9C59BAD7674AC1b9485Ede5c19af3B42F0516392;
    address constant public secondTreasuryAddress = 0xecB864Bfed3260388d1a7f8F182053F406074C5a;
    address constant public thirdTreasuryAddress = 0x93fE7D1d24bE7CB33329800ba2166f4D28Eaa553;

    address constant public ethFryContractAddress = 0x6c972b70c533E2E045F333Ee28b9fFb8D717bE69;
    address constant public balancerPermaFrostPoolAddress = 0x5277a42ef95ECa7637fFa9E69B65A12A089FE12b;
    address constant public burnAddress = 0x0000000000000000000000000000000000000001;

    address constant public teamToastAddress1 = 0xE5dDe1cc679184fc420E6f92e0Bd8C81E41D25e1;
    address constant public teamToastAddress2 = 0x91227d115D036a721F6455B4E201b2F74576da43;
    address constant public teamToastAddress3 = 0x16aF660A19567d273842c826b9b4f4992b5b4626;
    
    address constant public stakingContractAddress = 0x773617551B0A6455B366a3D706629725E34AF684;
    
    constructor() 
    {
        address _a_gulper = 0x1192AF4C49b88C7d102b1779E6E7d9A503366C28;
        glpr = IGulper(_a_gulper);

        address _a_deth = 0x51863Ec92BA14ede7B17fb2B053145C90E215A57;
        deth = IdEth(_a_deth);

        address _a_stakingRewards = 0x773617551B0A6455B366a3D706629725E34AF684;
        stakingRewards = IStakingRewards(_a_stakingRewards);

        address _a_queryStakingPool = 0xFFCFcD407556b00Eb17992Ef9b5e926D7faaA6C3;
        queryStakingPool = IQueryStakingPool(_a_queryStakingPool);
    }

    function getDataFromQueryStakingPool(address _staker) 
        public 
        view 
        returns (
            uint _availableBalance,
            uint _stakedBalance,
            uint _allowedBalance,
            uint _earned,
            uint _totalStakedValue,
            uint _APY,
            uint _rewardRate,
            uint _timestamp) 
    {
        (_availableBalance, _stakedBalance, _allowedBalance, _earned, _totalStakedValue, _APY, _rewardRate, _timestamp) = queryStakingPool.getData(stakingContractAddress, _staker);
    }

    function getPeriodFinishFromStakingRewards() 
        public 
        view 
        returns (uint _rewards) 
    {
        _rewards = stakingRewards.periodFinish();
    }
    
    function getTotalRaisedFromGulper() 
        public 
        view 
        returns (uint _raised) 
    {
        _raised = glpr.totalRaised();
    }

    function getCollateralFromDEth() 
        public 
        view 
        returns (
            uint _priceRay, 
            uint _totalCollateral, 
            uint _debt, 
            uint _collateralDenominatedDebt, 
            uint _excessCollateral) 
    {
        (_priceRay, _totalCollateral, _debt, _collateralDenominatedDebt, _excessCollateral) = deth.getCollateral();
    }

    function getTotalSupplyFromDEth() 
        public 
        view 
        returns (uint _supply) 
    {
        _supply = deth.totalSupply();
    }

    function getTreasuryBalances() 
        public 
        view 
        returns (
            uint _main, 
            uint _second, 
            uint _third) 
    {
        _main = IERC20(ethContractAddress).balanceOf(mainTreasuryAddress);
        _second = IERC20(ethContractAddress).balanceOf(secondTreasuryAddress);
        _third = IERC20(ethContractAddress).balanceOf(thirdTreasuryAddress);
    }

    function getBalancerPoolFryBalance() 
        public 
        view 
        returns (uint _poolBalance) 
    {
        _poolBalance = IERC20(ethFryContractAddress).balanceOf(balancerPermaFrostPoolAddress);
    }

    function getPermaFrostTotalSupply() 
        public 
        view 
        returns (uint _poolBalance) 
    {
        _poolBalance = IERC20(balancerPermaFrostPoolAddress).totalSupply();
    }

    function getPermaFrostLockedTokenBalance() 
        public 
        view 
        returns (uint _frostLockedBalance) 
    {
        _frostLockedBalance = IERC20(balancerPermaFrostPoolAddress).balanceOf(burnAddress);
    }

    function getTeamToastFryTokenBalance() 
        public 
        view 
        returns (
            uint _toast1, 
            uint _toast2, 
            uint _toast3) 
    {
        _toast1 = IERC20(ethFryContractAddress).balanceOf(teamToastAddress1);
        _toast2 = IERC20(ethFryContractAddress).balanceOf(teamToastAddress2);
        _toast3 = IERC20(ethFryContractAddress).balanceOf(teamToastAddress3);
    }

    function executeAllQueries(address _staker) 
        public 
        view 
        returns (uint[19] memory _results) 
    {
        _results[0] = getPeriodFinishFromStakingRewards();
        _results[1] = getTotalRaisedFromGulper();
        _results[2] = getTotalSupplyFromDEth();
        // _mainTAcc, _secondTAcc, _thirdTAcc
        (_results[3], _results[4], _results[5]) = getTreasuryBalances();
        // _priceRAY, _totalCollateral, _debt, _collateralDenominatedDebt, _excessCollateral
        (_results[6], _results[7], _results[8], _results[9], _results[10]) = getCollateralFromDEth();
        // _availableBalance, _stakedBalance, _allowedBalance, _earned, _totalStakedValue, _APY, _rewardRate, _timestamp
        (_results[11], _results[12], _results[13], _results[14], _results[15], _results[16], _results[17], _results[18]) = getDataFromQueryStakingPool(_staker);
    }
    
}
