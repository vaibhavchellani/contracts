contract validators {

struct validator{
  int stake;
  int acc;
  uint256 id;
}

uint256 count=0;
bool flag = false;
int sum = 0;
validator[] validators;

function add(int stake) {
  validators.push(validator(stake, stake, count));
  sum+=stake;
  count+=1;
}

function getProposers() returns(uint256){
    
    for(uint256 i=0; i<validators.length; i++){
        validators[i].acc += validators[i].stake; 
    }
    return getProposer();
}

function getProposer()returns (uint256){
    int max = -99999999999999;//  use -ve max
    uint256 index=0;
    for(uint256 i=0; i<validators.length; i++){
        if (max < validators[i].acc){
            max =validators[i].acc;
            index = i;
        }
    }
    validators[index].acc -= sum;
    return validators[index].id;
}

// test pilot 
function getNgetProposers(uint256 n) returns(uint256[]){
    add(4);
    add(2);
    add(2);
    add(2);
    uint256[] proposers;
    proposers.push(getProposer());
    for(uint256 i=1;i<n;i++){
       proposers.push(getProposers());
    }
    return proposers;
}
/*
getNgetProposers(20);
0,1,2,3,0,0,1,2,3,0,0,1,2,3,0,0,1,2,3,0
getProposer();// just one time
getProposers()



*/



}