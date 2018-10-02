pragma solidity ^0.4.22;

contract SimpleStore {
  uint256 value;

  event NewValueSet(uint256 indexed _value, address _sender);
  event NewValueSetAgain(uint256 indexed _value, address _sender);

  function set(uint256 _value) public {
    value = _value;
    emit NewValueSet(value, msg.sender);
  }

  function setAgain(uint256 _value) public {
    value = _value;
    emit NewValueSetAgain(value, msg.sender);
  }

  function get() public view returns (uint256, address) {
    return (value, msg.sender);
  }

  event NewTokenMinted(
    address indexed to,
    uint256 tokenId,
    string skill,
    string level
  );

  mapping(address => uint256[]) allTokensbyOwner;

  mapping(uint256 => string) skillForToken;
  mapping(string => uint256[]) allTokensbySkill;

  mapping(uint256 => string) levelForToken;
  mapping(string => uint256[]) allTokensbyLevel;

  string[] public levels = ["Gold", "Silver", "Bronze"];
  string[] public skills = ["JavaScript", "Node.js", "React.js"];


  function mint(address _to, uint256 _tokenId, string _level, string _skill) {
    emit NewTokenMinted(_to, _tokenId, _skill, _level);
    allTokensbyOwner[_to].push(_tokenId);
    skillForToken[_tokenId] = _skill;
    levelForToken[_tokenId] = _level;
  }
}
