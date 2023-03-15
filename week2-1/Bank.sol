// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank{
    //地址到余额的映射
    mapping (address=>uint256) private balances;

    //存款事件
    event Deposit(address indexed account,uint256 amount);

    //取钱事件
    event Withdrawal(address indexed account,uint256 amount);

    //存款函数
    function deposit() public payable{
        require(msg.value>0,"Deposit amount must be greater than 0.");
        balances[msg.sender] += msg.value ;
        emit Deposit(msg.sender,msg.value);
    }

    //取钱函数
    function withdraw(uint256 amount)public payable {
        require(amount>0,"Withdrawal amount must be greater than 0.");
        require(balances[msg.sender]>amount,"Insufficient balance.");
        balances[msg.sender]-=amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender,amount);
    }


    //查看余额函数 
    function getBalances() public view returns(uint256) {
        return balances[msg.sender];
    }

}