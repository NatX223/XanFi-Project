// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// importing the ERC20 token contract
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Index is ERC20 {

    // total supply of the token i.e total amount of tokens that can exist
    uint mintableSupply = 1000000 * (10 ** 18);
    uint ownerSupply = 10000 * (10 ** 18);
    address public Deployer;
    uint owners;

    // an array of the underlying assets for the index
    address[] public assetsContracts;
    string[] public assetsNames;
    uint[] public assetsRatio;

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        Deployer = msg.sender;
    }

    // function to create new fund
    function createIndex(address[] memory tokenAddresses, string[] memory tokenNames, uint[] memory ratio) public {
        // require that all arrays are of the same of length
        require(tokenAddresses.length == tokenNames.length && tokenAddresses.length == ratio.length && ratio.length == tokenNames.length, "All arrays have to be of the same length");
        assetsContracts = tokenAddresses;
        assetsNames = tokenNames;
        assetsRatio = ratio;
        // purchase tokens
            // purchase tokens from Uniswap
        // tokens are minted to owner
        mint();
        owners += 1;
    }

    function mint() internal {
        require(totalSupply() <= mintableSupply, "token supply limit has been reached");
        _mint(msg.sender, ownerSupply);
    }

    // function to redeem underlying assets
    // function to redeem stable coin
    // function to invest in fund
    // function to calculate prize
    // function to return deployer
    // function to return underlying assets and ratio
    // function to return number of holders
}
