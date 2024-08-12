// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.19;

import {IACLManager} from 'aave-address-book/AaveV3.sol';
import {IChainlinkAggregator} from 'cl-synchronicity-price-adapter/interfaces/IChainlinkAggregator.sol';
import {PriceCapAdapterBase, IPriceCapAdapter} from '../PriceCapAdapterBase.sol';

/**
 * @title EzETHPriceCapAdapter
 * @author Tokenlogic
 * @notice Price capped adapter to calculate price of (ezETH / USD) pair by using
 * @notice Chainlink data feed for (ETH / USD) and (ezETH / stETH) ratio.
 */
contract EzETHPriceCapAdapter is PriceCapAdapterBase {
  /**
   * @param capAdapterParams parameters to create cap adapter
   */
  constructor(
    CapAdapterParams memory capAdapterParams
  )
    PriceCapAdapterBase(
      CapAdapterBaseParams({
        aclManager: capAdapterParams.aclManager,
        baseAggregatorAddress: capAdapterParams.baseAggregatorAddress,
        ratioProviderAddress: capAdapterParams.ratioProviderAddress,
        pairDescription: capAdapterParams.pairDescription,
        ratioDecimals: 18,
        minimumSnapshotDelay: capAdapterParams.minimumSnapshotDelay,
        priceCapParams: capAdapterParams.priceCapParams
      })
    )
  {}

  /// @inheritdoc IPriceCapAdapter
  function getRatio() public view override returns (int256) {
    return IChainlinkAggregator(RATIO_PROVIDER).latestAnswer();
  }
}
