// SPDX-License-Identifier: ISC

pragma solidity ^0.5.16;

contract Ownable  
{     
  // Variable that maintains  
  // owner address 
  address private _owner; 
  
  // Sets the original owner of  
  // contract when it is deployed 
  constructor() public
  { 
    _owner = msg.sender; 
  } 
  
  // Publicly exposes who is the 
  // owner of this contract 
  function owner() public view returns(address)  
  { 
    return _owner; 
  } 
  
  // onlyOwner modifier that validates only  
  // if caller of function is contract owner,  
  // otherwise not 
  modifier onlyOwner()  
  { 
    require(isOwner(), 
    "Function accessible only by the owner !!"); 
    _; 
  } 
  
  // function for owners to verify their ownership.  
  // Returns true for owners otherwise false 
  function isOwner() public view returns(bool)  
  { 
    return msg.sender == _owner; 
  } 
}