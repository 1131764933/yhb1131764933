// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IScore{
    function setScore(address student,uint8 score) external;
}

contract Score is IScore{
    //老师地址变量
    address public teacher;
    //学生地址映射分数
    mapping(address=>uint8) scores;
    constructor (){
        teacher=msg.sender;
    }

    //仅老师操作
    modifier onlyTeacher(){
        require(msg.sender == teacher,"only teacher can add or update scores!");
        _;
    }

    //添加学生分数，且不可以大于100
    function setScore(address student,uint8 score)public override onlyTeacher {
        require(score<=100,"score must be less than or equal 100.");
        scores[student]=score;
    }
}


contract Teacher{
    IScore public scoreContract;
    //通过接口调用修改合约分数
    constructor (address scoreAddress){
        scoreContract =IScore(scoreAddress);
    }
    function updateScore(address student,uint8 score)public{
        scoreContract.setScore(student,score);
    }

}