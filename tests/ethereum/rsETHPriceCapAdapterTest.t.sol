// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import '../BaseTest.sol';

import {AaveV3Ethereum, AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';

import {RsETHPriceCapAdapter} from '../../src/contracts/lst-adapters/RsETHPriceCapAdapter.sol';
import {CapAdaptersCodeEthereum} from '../../scripts/DeployEthereum.s.sol';

contract rsETHPriceCapAdapterTest is BaseTest {
  constructor()
    BaseTest(
      CapAdaptersCodeEthereum.rsETHAdapterCode(),
      90,
      ForkParams({network: 'mainnet', blockNumber: 20427128}),
      'rsETH_Ethereum'
    )
  {}

  function _createAdapter(
    IPriceCapAdapter.CapAdapterParams memory capAdapterParams
  ) internal override returns (IPriceCapAdapter) {
    return new RsETHPriceCapAdapter(capAdapterParams);
  }
}
