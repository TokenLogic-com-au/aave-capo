// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IChainlinkAggregator} from 'cl-synchronicity-price-adapter/interfaces/IChainlinkAggregator.sol';

import './BaseTest.sol';
import {CLRatePriceCapAdapter} from '../src/contracts/CLRatePriceCapAdapter.sol';

abstract contract CLAdapterBaseTest is BaseTest {
  constructor(
    bytes memory _deploymentCode,
    address _referenceAdapter,
    uint8 _retrospectiveDays,
    ForkParams memory _forkParams
  ) BaseTest(_deploymentCode, _referenceAdapter, _retrospectiveDays, _forkParams) {}

  function _createAdapter(
    CapAdapterParams memory capAdapterParams
  ) internal override returns (IPriceCapAdapter) {
    return
      new CLRatePriceCapAdapter(
        capAdapterParams.aclManager,
        capAdapterParams.baseAggregatorAddress,
        capAdapterParams.ratioProviderAddress,
        capAdapterParams.pairDescription,
        capAdapterParams.minimumSnapshotDelay,
        capAdapterParams.priceCapParams
      );
  }
}
