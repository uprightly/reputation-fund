const TokenCollector = artifacts.require("TokenCollector");

import ether from 'zeppelin-solidity/test/helpers/ether';

const BigNumber = web3.BigNumber;

require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should();

/**
 * Unit tests for the reputation fund
 */
contract('TokenCollector', function ([owner, ...investors]) {

  beforeEach(async function () {
    this.fund = await TokenCollector.new();
  });


  it("should transfer tokens from user and add amount to reputation fund", async function () {

  });


});
