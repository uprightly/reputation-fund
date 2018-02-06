const ReputationFund = artifacts.require("ReputationFund");

import ether from 'zeppelin-solidity/test/helpers/ether';

const BigNumber = web3.BigNumber;

require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should();

/**
 * Unit tests for the reputation fund
 */
contract('ReputationFund', function ([owner, ...investors]) {

  beforeEach(async function () {
    this.fund = await ReputationFund.new();
  });

  it("should report a user's reputation fund amount", async function () {
    const fundBalance = this.fund.balanceOf(investors[0]);
    const expectedBalance = new BigNumber(0);
    fundBalance.should.be.bignumber.equal(expectedBalance);
  });

  it("should add to a user's reputation fund amount", async function () {
    await this.fund.add(investors[0], 123);
    const fundBalance = this.fund.balanceOf(investors[0]);
    const expectedBalance = new BigNumber(123);
    fundBalance.should.be.bignumber.equal(expectedBalance);
  });

  it("should only allow authorized operators to add", async function () {

  });

  it("should subtract from a user's reputation fund amount", async function () {
    await this.fund.add(investors[0], 12);
    await this.fund.subtract(investors[0], 10);
    const fundBalance = this.fund.balanceOf(investors[0]);
    const expectedBalance = new BigNumber(2);
    fundBalance.should.be.bignumber.equal(expectedBalance);
  });

  it("should only allow authorized operators to subtract", async function () {

  });

  it("should update authorized operators", async function () {

  });

  it("should only allow authorized operators to update authorized operators", async function () {

  });


});
