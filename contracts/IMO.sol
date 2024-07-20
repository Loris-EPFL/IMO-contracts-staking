// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { OFT } from "@layerzerolabs/lz-evm-oapp-v2/contracts/oft/OFT.sol";

contract IMO is OFT {
    string oftName = "IMO";
    string oftSymbol = "IMO";
    address lzEndpoint = msg.sender;
    address public immutable locker; //address of the locker contract
    address delegate = address(msg.sender); //address of the delegator (default contract deployer msg.sender, might change later)
    uint public IMOtotalSupply = 20e6;

    constructor() OFT(oftName, oftSymbol, lzEndpoint, delegate) Ownable(delegate) {
        _mint(delegate, IMOtotalSupply);
    }

    //utils to mint tokens if needed, make sure its only callable by owner (delegate)
    function mint(address _to, uint256 _amount) onlyOwner() public {
        _mint(_to, _amount);
    }

    
    function transferToLocker(address sender, uint256 amount) external returns (bool) {
        require(msg.sender == locker, "Not locker");
        _transfer(sender, locker, amount);
        return true;
    }

    
}
