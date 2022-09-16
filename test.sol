

//prog under testing & some module(s) under _developement
//counter --0.7.6
//integrations - testing under eth-testnet (not finalized _current - rinkeby)


//<TOTAL MODULES 4
// 1.User registration
// 2. U.A
// 3. U.A
// 4. U.A
//user - registration --Buyer/NormalUser


pragma solidity ^0.8.0;

//user --register code (ParserError)
//Module1 - UserRegister
contract UserRegister{
    
  mapping(address => uint) private addressToIndex;
  mapping(bytes16 => uint) private usernameToIndex;
  address[] private addresses;
  bytes16[] private usernames;
  bytes[] private ipfsHashes;
function User () public {
    // mappings are virtually initialized to zero values so we need to "waste" the first element of the arrays
    // instead of wasting it we use it to create a user for the contract itself
    addresses.push(msg.sender);
    usernames.push('self');
    ipfsHashes.push('not-available');
}
function hasUser(address userAddress) public view returns(bool hasIndeed) 
  {
    return (addressToIndex[userAddress] > 0 || userAddress == addresses[0]);
  }
function usernameTaken(bytes16 username) public view returns(bool takenIndeed) 
  {
    return (usernameToIndex[username] > 0 || username == 'self');
  }
  
function createUser(bytes16 username, bytes ipfsHash) public returns(bool success)
  {
    require(!hasUser(msg.sender));
    require(!usernameTaken(username));
addresses.push(msg.sender);
    usernames.push(username);
    ipfsHashes.push(ipfsHash);
addressToIndex[msg.sender] = addresses.length - 1;
    usernameToIndex[username] = addresses.length - 1;
    
    return true;
  }
function updateUser(bytes ipfsHash) public returns(bool success)
  {
    require(hasUser(msg.sender));
    
    ipfsHashes[addressToIndex[msg.sender]] = ipfsHash;
    return true;
  }  
 
  function getUserCount() public view returns(uint count)
  {
    return addresses.length;
  }
// get by index
  function getUserByIndex(uint index) public view returns(address userAddress, bytes16 username, bytes ipfsHash) {
    require(index < addresses.length);
return(addresses[index], usernames[index], ipfsHashes[index]);
  }
function getAddressByIndex(uint index) public view returns(address userAddress)
  {
    require(index < addresses.length);
return addresses[index];
  }
function getUsernameByIndex(uint index) public view returns(bytes16 username)
  {
    require(index < addresses.length);
return usernames[index];
  }
function getIpfsHashByIndex(uint index) public view returns(bytes ipfsHash)
  {
    require(index < addresses.length);
return ipfsHashes[index];
  }
// get by address
  function getUserByAddress(address userAddress) public view returns(uint index, bytes16 username, bytes ipfsHash) {
    require(index < addresses.length);
return(addressToIndex[userAddress], usernames[addressToIndex[userAddress]], ipfsHashes[addressToIndex[userAddress]]);
  }
function getIndexByAddress(address userAddress) public view returns(uint index)
  {
    require(hasUser(userAddress));
return addressToIndex[userAddress];
  }
function getUsernameByAddress(address userAddress) public view returns(bytes16 username)
  {
    require(hasUser(userAddress));
return usernames[addressToIndex[userAddress]];
  }
function getIpfsHashByAddress(address userAddress) public view returns(bytes ipfsHash)
  {
    require(hasUser(userAddress));
return ipfsHashes[addressToIndex[userAddress]];
  }
// get by username
  function getUserByUsername(bytes16 username) public view returns(uint index, address userAddress, bytes ipfsHash) {
    require(usernameToIndex[username] < addresses.length);
return(usernameToIndex[username], addresses[usernameToIndex[username]], ipfsHashes[usernameToIndex[username]]);
  }
function getIndexByUsername(bytes16 username) public view returns(uint index)
  {
    require(usernameTaken(username));
return usernameToIndex[username];
  }
function getAddressByUsername(bytes16 username) public view returns(address userAddress)
  {
    require(usernameTaken(username));
return addresses[usernameToIndex[username]];
  }
function getIpfsHashByUsername(bytes16 username) public view returns(bytes ipfsHash)
  {
    require(usernameTaken(username));
return ipfsHashes[usernameToIndex[username]];
  }
}

//uncompiled
//test -0
//lst-check - 15/09/22 21:56


struct ManufacturerInfo {
uint40 companyPrefix;
bytes32 companyName;
uint expireTime;
}
mapping (address => ManufacturerInfo)
manufacturers;
mapping (uint40 => address)
companyPrefixToAddress;
function enrollManufacturer(address m,
uint40 companyPrefix, bytes32 companyName,
uint validDurationInYear) onlyAdmin {
manufacturers[m].companyPrefix =
companyPrefix;
manufacturers[m].companyName =
companyName;
manufacturers[m].expireTime = now +
validDurationInYear;
companyPrefixToAddress[companyPrefix] =
manufacturer;
}
// ^companyName() - needs simplication
//

//product current status
enum ProductStatus {Shipped, Owned,
Returned}
struct ProductInfo {
address owner;
address recipient;
ProductStatus status;
uint creationTime;
uint8 nTransferred;
}

//get current product_owner 

function getCurrentOwner(uint96 EPC)
onlyExist(EPC)
returns (address) {
return products[EPC].owner;
}
