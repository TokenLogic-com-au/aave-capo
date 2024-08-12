// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import '../BaseTest.sol';

import {AaveV3Ethereum, AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';

import {EzETHPriceCapAdapter} from '../../src/contracts/lst-adapters/EzETHPriceCapAdapter.sol';
import {CapAdaptersCodeEthereum} from '../../scripts/DeployEthereum.s.sol';

contract ezETHPriceCapAdapterTest is BaseTest {
  constructor()
    BaseTest(
      CapAdaptersCodeEthereum.ezETHAdapterCode(),
      30,
      ForkParams({network: 'mainnet', blockNumber: 20512711}),
      'ezETH_Ethereum'
    )
  {}

  function _createAdapter(
    IPriceCapAdapter.CapAdapterParams memory capAdapterParams
  ) internal override returns (IPriceCapAdapter) {
    return new EzETHPriceCapAdapter(capAdapterParams);
  }
}