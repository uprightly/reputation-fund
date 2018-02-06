pragma solidity ^0.4.18;

import "../node_modules/zeppelin-solidity/contracts/token/ERC827/ERC827Token.sol";
import "./ReputationFund.sol";

/**
 * Contract to be alerted when a user wants to add token to their Reputation Fund.
 * TODO: use safe math functions.
 * TODO: extract authorizedUsers code to common module.
 */
contract TokenCollector {
  mapping (address => bool) private authorizedOperators;
  ERC827Token private token;
  ReputationFund private reputationFund;

  function TokenCollector() public {
    authorizedOperators[msg.sender] = true;
  }

  modifier onlyAuthorized() {
    require(authorizedOperators[msg.sender] == true);
    _;
  }

  function updateAuthorizedOperator(address operator, bool authorized) public onlyAuthorized {
    require(msg.sender != operator); // protect from locking ourselves out.
    authorizedOperators[operator] = authorized;
  }

  function setToken(address tokenAddress) public onlyAuthorized {
    token = ERC827Token(tokenAddress);
  }

  function setReputationFund(address fundAddress) public onlyAuthorized {
    reputationFund = ReputationFund(fundAddress);
  }

  function collect(address from) public {
    uint256 approvedAmount = token.allowance(from, this);
    require(approvedAmount > 0);
    token.transferFrom(from, this, approvedAmount);
    reputationFund.add(from, approvedAmount);
  }

}
