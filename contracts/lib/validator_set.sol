pragma solidity ^0.4.24;


contract ValidatorSet {

  struct Validator {
    int stake;
    int acc;
    uint256 id;
  }

  uint256 count = 0;
  bool flag = false;
  int sum = 0;
  Validator[] validators;

  function addValidator(int stake) public {
    validators.push(Validator(stake, stake, count));
    sum += stake;
    count += 1;
  }

  function getProposers() public returns(uint256){
    require(validators.length > 0);
    if (!flag) {
      flag = true;
      return getProposer();
    }

    for (uint8 i = 0; i<validators.length; i++) {
      validators[i].acc += validators[i].stake; 
    }
    return getProposer();
  }

  function getProposer() private returns (uint256){
    int max = -99999999999999;//  use -ve max
    uint8 index = 0;
    for (uint8 i = 0; i<validators.length; i++) {
      if (max < validators[i].acc){
        max = validators[i].acc;
        index = i;
      }
    }
    validators[index].acc -= sum;
    return validators[index].id;
  }

  // test pilot 
  function getNgetProposers(uint256 n) public returns(uint256[]) {
    addValidator(4);
    addValidator(2);
    addValidator(2);
    addValidator(2);
    uint256[] proposers;

    for (uint256 i = 0; i<n; i++) {
      proposers.push(getProposers());
    }
    return proposers;
  }

  /*getNgetProposers(20);
    0,1,2,3,0,0,1,2,3,0,0,1,2,3,0,0,1,2,3,0
    getProposer();// just one time
    getProposers() */
  }
