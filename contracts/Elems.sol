pragma solidity ^0.8.10;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Elems is ERC721URIStorage, AccessControl {

    using Strings for uint256;

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Elems", "ELEM") {

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(BURNER_ROLE, msg.sender);

        _setRoleAdmin(ADMIN_ROLE, DEFAULT_ADMIN_ROLE);
        _setRoleAdmin(MINTER_ROLE, ADMIN_ROLE);
        _setRoleAdmin(BURNER_ROLE, ADMIN_ROLE);

    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }


    function mintNFT(address recipient, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

}