// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { OFT } from "@layerzerolabs/lz-evm-oapp-v2/contracts/oft/OFT.sol";

contract IMO is OFT {
    //string oftName = "IMO";
    //string oftSymbol = "IMO";
   // address lzEndpoint = 0x6EDCE65403992e310A62460808c4b910D972f10f; //base sepolia
    //address delegate = address(msg.sender); //address of the delegator (default contract deployer msg.sender, might change later)
    uint public IMOtotalSupply = 20e24;

    constructor(string memory oftName, string memory oftSymbol, address lzEndpoint, address delegate) OFT(oftName, oftSymbol, lzEndpoint, delegate) Ownable(delegate) {
        _mint(delegate, IMOtotalSupply);
    }

    //utils to mint tokens if needed, make sure its only callable by owner (delegate)
    function mint(address _to, uint256 _amount) onlyOwner() public {
        _mint(_to, _amount);
    }
    
}
