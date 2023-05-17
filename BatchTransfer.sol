pragma solidity ^0.8.0;

contract BatchTransfer {
    address public owner;  
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }  
    
    function batchTransfer(address[] calldata recipients, uint[] calldata amounts) external onlyOwner payable {
        require(recipients.length == amounts.length, "Length mismatch");
        for (uint i = 0; i < recipients.length; i++) {
            uint amount = amounts[i] * 1 ether / 100;     
            recipients[i].call{value: amount}("");
        }
    }  
}
