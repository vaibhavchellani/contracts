pragma solidity ^0.4.24;


contract ValidatorSet {

  struct Validator {
    uint256 stake;
    int256 accumulator;
    address proposer;
  }

  uint256 private sum;
  Validator[] public validators;
  address public currentProposer;

  constructor() public {
    sum = 0;
    currentProposer = address(0);
  }

  function addValidator(uint256 stake, address proposer) public {
    require(stake > 0);
    validators.push(Validator(stake, int256(stake), proposer));
    sum += stake;
  }

  function getProposers() public returns(address) {
    require(validators.length > 0);
    if (currentProposer == address(0)) {
      return getProposer();
    }

    for (uint8 i = 0; i < validators.length; i++) {
      validators[i].accumulator += int(validators[i].stake); 
    }
    return getProposer();
  }

  function getProposer() private returns (address) {
    int256 max = -99999999999999;//  use -ve max
    uint8 index = 0;
    for (uint8 i = 0; i < validators.length; i++) {
      if (max < validators[i].accumulator){
        max = validators[i].accumulator;
        index = i;
      }
    }
    validators[index].accumulator -= int(sum);
    currentProposer = validators[index].proposer;
    return validators[index].proposer;
  }

  // test pilot 
  function getNProposers(uint8 n) public returns (address[]) {
    addValidator(4, address(1));
    addValidator(2, address(2));
    addValidator(2, address(3));
    addValidator(2, address(4));
    address[] memory proposers = new address[](n);

    for (uint8 i = 0; i < n; i++) {
      proposers[i] = getProposers();
    }
    return proposers;
  }

  /*getNgetProposers(20);
    0,1,2,3,0,0,1,2,3,0,0,1,2,3,0,0,1,2,3,0
    getProposer();// just one time
    getProposers() */
}
