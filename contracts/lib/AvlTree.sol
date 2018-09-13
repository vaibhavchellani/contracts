pragma solidity ^0.4.24;

import { Math } from "openzeppelin-solidity/contracts/math/Math.sol";

contract avlTree {
  struct node {
    uint256 value;
    uint256 left;
    uint256 right;
		uint256 height;
  }
	node[] tree; 
  uint256 count = 0;

  constructor() public {
		tree.push(0,0,0,0);
  }


  function getHeight(uint256 n){
		tree[n].height = 1 + math.max256(tree[tree[n].left].height, tree[tree[n].right].height);
  }



function search(uint256 n, uint256 value) public returns(bool){
	if (n == 0 || value == 0) {  // add correct condition solidity
			return false;// return true/false !? ;-)
	}

	if (tree[n].value == value) {
		return true;
	}

	if (val < tree[n].value){
		return search(tree[n].left, value);
	}
	else{
		return search(tree[n].right, value);
	}

}

function insert(uint256 n, uint256 value) returns(node){
		if (n == NIL) {
			n = node();
			n.value = value;
			n.left = n.right = NIL;
			n.height = 1;
			return n;
		}

		if (val <= n.value){
			 n.left = insert(n.left, value);
		}
		else {
			n.right = insert(n.right, value);
		}
		return balance(n);
}

function delete(ndoe n, uint256 value) returns(node){
		ndoe temp;
		if (n == NIL) {
			return n;
		}
		if (n.value == value)
		{
			if (n.left == NIL || n.right == NIL)
			{
				if (n.left == NIL){
					 temp = n.right;
				}
				else{
					 temp = n.left;
				}
				delete n;
				return temp;
			}
			else
			{
				for (temp = n.right; temp.left != NIL; temp = temp.left);
				n.value = temp.value;
				n.right = Delete(n.right, temp.value);
				return Balance(n);
			}
		}

		if (value < n.value) n.left = Delete(n.left, value);
		else n.right = Delete(n.right, value);

		return Balance(n);
}
function rotateLeft(node n) {
		node temp = n.left;
		n.left = temp.right;
		temp.right = n;
		getHeight(n);
		getHeight(temp);

		return temp;
}

function rotateRight (node n){
		node temp = n.right;
		n.right = temp.left;
		temp.left = n;
		getHeight(n);
		getHeight(temp);

		return temp;
}

function balance(node n) { 
		getHeight(n);
		if (n.left.height > n.right.height + 1)
		{
			if (n.left.right.height > n.left.left.height){
				n.left = rotateRight(n.left);
			}
			n = rotateLeft(n);
		}
		else
		if (n.right.height > n.left.height + 1)
		{
			if (n.right.left.height > n.right.right.height){
				n.right = rotateLeft(n.right);
		}
			n = rotateRight(n);
		}
		return n;
}


}
