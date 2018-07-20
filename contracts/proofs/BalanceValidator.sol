// check if output from prev is input to next 
pragma solidity ^0.4.23;

import "../mixin/RootChainValidator.sol";
import "../lib/RLP.sol";
import "../lib/BytesLib.sol";
import "../lib/SafeMath.sol";


contract BalanceValidator is RootChainValidator {
    using RLP for bytes;
    using RLP for RLP.RLPItem;
    using RLP for RLP.Iterator;
    using SafeMath for uint256;

    // input transactions 
    function validateBalance(bytes tx1, bytes tx2) public returns(bool){
        RLP.RLPItem[] memory txData1 = tx1.toRLPItem().toList();
        RLP.RLPItem[] memory txData2 = tx2.toRLPItem().toList();
        RLP.RLPItem[] memory item1 = txData1[9].toData().toRLPItem().toList();
        RLP.RLPItem[] memory item2 = txData2[9].toData().toRLPItem().toList();
        return validateParams(BytesLib.toUint(item1[2].toData(), 64), 
                              BytesLib.toUint(item1[2].toData(), 96),
                                BytesLib.toUint(item2[2].toData(), 0),
                                BytesLib.toUint(item2[2].toData(), 32)            
                                );
        
    }

    function validateParams(uint256 input1, uint256 input2, uint256 output1, uint256 output2) returns (bool) {
        if ((input1.add(input2)) == (output1.add(output2)))
            return true;
        else
            return false;
    }
}
