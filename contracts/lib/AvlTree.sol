pragma solidity ^0.4.24;

import { Math } from "openzeppelin-solidity/contracts/math/Math.sol";
pragma solidity ^0.4.24;


contract AvlTree {
  struct node {
    uint256 value;
    uint256 left;
    uint256 right;
	uint256 height;
  }
  
  node[] tree; 
  uint256 root = 0;
    event order(uint256 value);
  constructor() public {
		tree.push(node(0,0,0,0));
  }
  
  // function max256(uint256 a, uint256 b) private pure returns (uint256) { 
  //     if(a>b) return a;
  //     return b;
  // }

  function getHeight(uint256 n) public {
    if(n>0){ 
	tree[n].height = 1 + Math.max256(tree[tree[n].left].height, tree[tree[n].right].height);
    }
  }



function search(uint256 n, uint256 value) public returns(bool){
	if (n == 0 || value == 0) {  // add correct condition solidity
			return false;// return true/false !? ;-)
	}

	if (tree[n].value == value) {
		return true;
	}

	if (value < tree[n].value){
		return search(tree[n].left, value);
	}
	else{
		return search(tree[n].right, value);
	}

}

function insertValue(uint256 value) public returns(uint256) {
    require(value > 0);
    if(root == 0){
        tree.push(node({
            value:value,
            left:0,
            right:0,
            height:0
        }));
        root = 1;
        return tree.length;
    }
    root =  insert(root,value);
    return root;
}

function insert(uint256 n, uint256 value) private returns(uint256){
		if (n == 0) {
			tree.push(node({
			    value:value,
			    left:0,
			    right:0,
			    height:1
			}));
			return (tree.length - 1);
		}

		if (value <= tree[n].value) {
			 tree[n].left = insert(tree[n].left, value);
		}
		else {
			tree[n].right = insert(tree[n].right, value);
		}
		return balance(n);
}

// function deleteNode(node n, uint256 value) returns(node){
// 		ndoe temp;
// 		if (n == NIL) {
// 			return n;
// 		}
// 		if (n.value == value)
// 		{
// 			if (n.left == NIL || n.right == NIL)
// 			{
// 				if (n.left == NIL){
// 					 temp = n.right;
// 				}
// 				else{
// 					 temp = n.left;
// 				}
// 				delete n;
// 				return temp;
// 			}
// 			else
// 			{
// 				for (temp = n.right; temp.left != NIL; temp = temp.left);
// 				n.value = temp.value;
// 				n.right = deleteNode(n.right, temp.value);
// 				return Balance(n);
// 			}
// 		}

// 		if (value < n.value) n.left = Delete(n.left, value);
// 		else n.right = Delete(n.right, value);

// 		return Balance(n);
// }
function rotateLeft(uint256 n) private returns (uint256 )  {
		uint256 temp = tree[n].left;
		tree[n].left = tree[temp].right;
		tree[temp].right = n;
		getHeight(n);
		getHeight(temp);

		return temp;
}

function rotateRight (uint256 n) private returns (uint256) {
		uint256 temp = tree[n].right;
		tree[n].right = tree[temp].left;
		tree[temp].left = n;
		getHeight(n);
		getHeight(temp);

		return temp;
}

// temp helper function 
function getChilds(uint256 index) public view  returns(uint256 left, uint256 right) {
    left = tree[index].left;
    right = tree[index].right;
}

// temp helper function
function getTree() public view returns(uint256[]) {
    uint256[] memory _tree = new uint256[](tree.length);
    for(uint256 i=0;i<tree.length;i++){
        _tree[i] = tree[i].value;
    }
    return _tree;
}


function balance(uint256 n) private returns (uint256){ 
		getHeight(n);
		if (tree[tree[n].left].height > tree[tree[n].right].height + 1)
		{		
			if (tree[tree[tree[n].left].right].height > tree[tree[tree[n].left].left].height){
				tree[n].left = rotateRight(tree[n].left);
			}
			n = rotateLeft(n);
		}
		else
		if (tree[tree[n].right].height > tree[tree[n].left].height + 1)
		{
			if (tree[tree[tree[n].right].left].height > tree[tree[tree[n].right].right].height){
				tree[n].right = rotateLeft(tree[n].right);
		}
			n = rotateRight(n);
		}
		return n;
}


}


