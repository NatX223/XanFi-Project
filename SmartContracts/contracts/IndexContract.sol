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

    // mapping to hold all users
    mapping (address => bool) holders;

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        Deployer = msg.sender;
    }

    // function to create new fund
    function createIndex(address[] memory tokenAddresses, string[] memory tokenNames, uint[] memory ratio, uint amount) public {
        // require that all arrays are of the same of length
        require(tokenAddresses.length == tokenNames.length && tokenAddresses.length == ratio.length && ratio.length == tokenNames.length, "All arrays have to be of the same length");
        assetsContracts = tokenAddresses;
        assetsNames = tokenNames;
        assetsRatio = ratio;
        // calculate the amount to be bought for each token
        uint unit;
        uint sum = 0;
        uint tokenAmount;
        for (uint i = 0; i < ratio.length; i++) {
            sum += ratio[i];
            unit = amount / sum;
            tokenAmount = unit * ratio[i];
            // purchase tokens
                // create function to buy the tokens from uniswap for each token
                // purchase tokens from Uniswap
        }

        // tokens are minted to owner
        deployerMint();
        owners += 1;
        holders[msg.sender] = true;
    }

    function deployerMint() internal {
        require(totalSupply() <= mintableSupply, "token supply limit has been reached");
        _mint(msg.sender, ownerSupply);
    }

    function mint (uint mintAmount) internal {
        require(totalSupply() <= mintableSupply, "token supply limit has been reached");
        _mint(msg.sender, mintAmount);
    }

    // function to redeem underlying assets
        // get underlying assets
        // get price
        // get corresponding value for each asset
        // transfer assets to user
        // burn tokens

    // function to redeem stable coin
        // get underlying assets
        // get price
        // get corresponding value for each asset
        // swap all assets for USDT
        // transfer USDT to user
        // burn tokens

    // function to invest in fund
    function invest(uint amount) public {
        // calculate the amount to be bought for each token
        uint unit;
        uint sum = 0;
        uint tokenAmount;
        for (uint i = 0; i < assetsRatio.length; i++) {
            sum += assetsRatio[i];
            unit = amount / sum;
            tokenAmount = unit * assetsRatio[i];
            // purchase tokens
                // purchase tokens from Uniswap
                // store assets in the smart contract
        }
        // // create function to get the price of the token
        // uint price = Price();
        // uint mintAmount = amount / price; 
        // // tokens are minted to owner
        // mint(mintAmount);
        holders[msg.sender] = true;
        if (holders[msg.sender] != true) {
            owners += 1;
        }
        else {
            owners += 0;
        }
    }

    // function to calculate price
    function Price() public view returns (uint) {
        uint tokenSupply = totalSupply();
        uint nav = 0;
        for (uint i = 0; i < assetsContracts.length; i++) {
            uint assetPrice = getPrice(assetsContracts[i]);
            uint balance = getBalance(assetsContracts[i]);
            uint assetValue = assetPrice * balance;
            nav += assetValue;
            uint price = nav / tokenSupply;
        }

    }

    // function to return all prices of the tokens
    function getPrice(address token) internal returns(uint) {
        // write interface and instatiate
    }

    function getBalance(address token) internal returns (uint) {
        // write interface and instatiate
    }

    function getDeployer() public view returns (address) {
        return Deployer;
    }
    // function to return underlying assets and ratio
    function getContracts() public view returns (address[] memory) {
        return assetsContracts;
    }
    function getNames() public view returns (string[] memory) {
        return assetsNames;
    }
    function getRatio() public view returns (uint[] memory) {
        return assetsRatio;
    }
    // function to return number of holders
    function getOwners() public view returns (uint) {
        return owners;
    }

    // function to return fund details
    function Details() public view returns (address, address[] memory, string[] memory, uint[] memory, uint) {
        return(Deployer, assetsContracts, assetsNames, assetsRatio, owners);
    }

}
