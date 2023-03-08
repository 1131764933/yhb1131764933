// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Counter{
    uint256  public counter;
    //constructor Counter() {}
    function add() public  returns(uint256)  {
        counter = counter + 1;
        return counter;
    }
}