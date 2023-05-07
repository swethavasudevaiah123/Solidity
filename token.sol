// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    
    mapping(address => uint256) public balanceOf;
    
    address public owner;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * 10 ** decimals;
        balanceOf[msg.sender] = totalSupply;
        
        owner = msg.sender;
    }


    
    function mint(address _to, uint256 _value) public {
        require(msg.sender == owner, "Only owner can mint");
        balanceOf[_to] += _value;
        totalSupply += _value;
       
    }
    
    function burn(uint256 _value) public {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        
    }
}
