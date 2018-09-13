pragma solidity ^0.4.24;


contract ValidatorSet {

  struct Validator {
    uint256 stake;
    int accumulator;
    address proposer;
  }

  int private sum;
  Validator[] public validators;
  address public currentProposer;

  constructor() public {
    sum = 0;
    count = 0;
    currentProposer = address(0);
  }

  function addValidator(uint256 stake) public {
    require(stake > 0);
    validators.push(Validator(stake, stake, count));
    sum += stake;
  }

  function getProposers() public returns(uint256) {
    require(validators.length > 0);
    if (currentProposer == address(0)) {
      return getProposer();
    }

    for (uint8 i = 0; i < validators.length; i++) {
      validators[i].accumulator += validators[i].stake; 
    }
    return getProposer();
  }

  function getProposer() private returns (uint256) {
    int max = -99999999999999;//  use -ve max
    uint8 index = 0;
    for (uint8 i = 0; i < validators.length; i++) {
      if (max < validators[i].accumulator){
        max = validators[i].accumulator;
        index = i;
      }
    }
    validators[index].accumulator -= sum;
    currentProposer = validators[index].proposer;
    return validators[index].proposer;
  }

  // test pilot 
  function getNProposers(uint256 n) public returns (uint256[]) {
    addValidator(4);
    addValidator(2);
    addValidator(2);
    addValidator(2);
    uint256[] proposers;

    for (uint256 i = 0; i < n; i++) {
      proposers.push(getProposers());
    }
    return proposers;
  }

  /*getNgetProposers(20);
    0,1,2,3,0,0,1,2,3,0,0,1,2,3,0,0,1,2,3,0
    getProposer();// just one time
    getProposers() */
}
