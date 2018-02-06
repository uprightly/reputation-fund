pragma solidity ^0.4.18;

/**
 * Contract meant for tracking the balance of users' Reputation Funds.
 * TODO: use safe math functions
 */
contract ReputationFund {
  mapping (address => bool) private authorizedOperators;
  mapping (address => uint256) private balances;

  function ReputationFund() public {
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

  function add(address user, uint256 value) public onlyAuthorized returns (uint256) {
    require(value > 0);
    balances[user] += value;
    return balances[user];
  }

  function subtract(address user, uint256 value) public onlyAuthorized returns (uint256) {
    require(value > 0);
    if (balances[user] >= value) {
      balances[user] -= value;
    } else {
      balances[user] = 0;
    }
    return balances[user];
  }

  function balanceOf(address user) public view returns (uint256) {
    return balances[user];
  }
}
