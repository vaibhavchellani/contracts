pragma solidity ^0.4.24;

import { Math } from "openzeppelin-solidity/contracts/math/Math.sol";

contract avlTree {
  struct node {
    uint256 value;
    node left;
    node right;
		uint256 height;
  }

	node root;
  uint256 count = 0;
  constructor() public {
  //   	void Init()
	// {
	// 	R = NIL = new Node<T>;
	// 	NIL->h = 0;
	// 	NIL->left = NIL->right = NULL;
	// }
  }


  function getHeight(node n){
		n.height = 1 + math.Max(n.left.height, n.right.height);
  }



function search() public returns(bool){
	// bool Search(Node<T> *N, T val)
	// {
	// 	if (N == NIL) return false;

	// 	if (N->value == val) return true;

	// 	if (val < N->value)
	// 		return Search(N->left, val);
	// 	else
	// 		return Search(N->right, val);
	// }
}

function insert() returns(node){
	// Node<T>* Insert(Node<T> *N, T val)
	// {  
	// 	if (N == NIL)
	// 	{
	// 		N = new Node<T>;
	// 		N->value = val;
	// 		N->left = N->right = NIL;
	// 		N->h = 1;

	// 		return N;
	// 	}

	// 	if (val <= N->value) N->left = Insert(N->left, val);
	// 	else N->right = Insert(N->right, val);

	// 	return Balance(N);
	// }
}

function delete() returns(node){
	// Node<T>* Delete(Node<T> *N, T val)
	// {
	// 	Node<T> *t;
	// 	if (N == NIL) return N;
	// 	if (N->value == val)
	// 	{
	// 		if (N->left == NIL || N->right == NIL)
	// 		{
	// 			if (N->left == NIL) t = N->right;
	// 			else t = N->left;
	// 			delete N;
	// 			return t;
	// 		}
	// 		else
	// 		{
	// 			for (t = N->right; t->left != NIL; t = t->left);
	// 			N->value = t->value;
	// 			N->right = Delete(N->right, t->value);
	// 			return Balance(N);
	// 		}
	// 	}

	// 	if (val < N->value) N->left = Delete(N->left, val);
	// 	else N->right = Delete(N->right, val);

	// 	return Balance(N);
	// }
}
function rotateLeft(node n) {
	// Node<T>* RotateLeft(Node<T> *N)
	// {
	// 	Node<T> *t = N->left;
	// 	N->left = t->right;
	// 	t->right = N;
	// 	GetHeight(N);
	// 	GetHeight(t);

	// 	return t;
	// }
}

function rotateRight (node n){
	// Node<T>* RotateRight(Node<T> *N)
	// {
	// 	Node<T> *t = N->right;
	// 	N->right = t->left;
	// 	t->left = N;
	// 	GetHeight(N);
	// 	GetHeight(t);

	// 	return t;
	// }
}

function balance(node n) { 
	// Node<T>* Balance(Node<T> *N)
	// {
	// 	GetHeight(N);

	// 	if (N->left->h > N->right->h + 1)
	// 	{
	// 		if (N->left->right->h > N->left->left->h)
	// 			N->left = RotateRight(N->left);
	// 		N = RotateLeft(N);
	// 	}
	// 	else
	// 	if (N->right->h > N->left->h + 1)
	// 	{
	// 		if (N->right->left->h > N->right->right->h)
	// 			N->right = RotateLeft(N->right);
	// 		N = RotateRight(N);
	// 	}

	// 	return N;
	// }
}


}