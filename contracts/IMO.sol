// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { OFT } from "@layerzerolabs/lz-evm-oapp-v2/contracts/oft/OFT.sol";

contract IMO is OFT {
        /*
    /$$$$$$ /$$      /$$  /$$$$$$        /$$$$$$ /$$   /$$ /$$    /$$ /$$$$$$$$  /$$$$$$  /$$$$$$$$
    |_  $$_/| $$$    /$$$ /$$__  $$      |_  $$_/| $$$ | $$| $$   | $$| $$_____/ /$$__  $$|__  $$__/
    | $$  | $$$$  /$$$$| $$  \ $$        | $$  | $$$$| $$| $$   | $$| $$      | $$  \__/   | $$   
    | $$  | $$ $$/$$ $$| $$  | $$        | $$  | $$ $$ $$|  $$ / $$/| $$$$$   |  $$$$$$    | $$   
    | $$  | $$  $$$| $$| $$  | $$        | $$  | $$  $$$$ \  $$ $$/ | $$__/    \____  $$   | $$   
    | $$  | $$\  $ | $$| $$  | $$        | $$  | $$\  $$$  \  $$$/  | $$       /$$  \ $$   | $$   
    /$$$$$$| $$ \/  | $$|  $$$$$$/       /$$$$$$| $$ \  $$   \  $/   | $$$$$$$$|  $$$$$$/   | $$   
    |______/|__/     |__/ \______/       |______/|__/  \__/    \_/    |________/ \______/    |__/                                                                                     
    */

    constructor(string memory oftName, string memory oftSymbol, address lzEndpoint, address delegate) OFT(oftName, oftSymbol, lzEndpoint, delegate) Ownable(delegate) {
        _mint(delegate, 20*10e6*10e18); //Mint Total Supply (20 Millions IMO) to delegate(owner)
    }
    
}
