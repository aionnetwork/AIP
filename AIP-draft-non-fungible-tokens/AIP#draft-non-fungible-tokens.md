---
AIP: TO BE ASSIGNED
Title: Aion Nonfungible Token Standard
Author(s): William Entriken
Type: ASC
Status: Socialization
Creation Date: 2019-07-05
Contact Information: github.com@phor.net
---

### Summary

A standard interface for non-fungible tokens, also known as deeds.

### Value Proposition 

The following standard provides basic functionality for AVM contracts to track and transfer NFTs.

Remember:

> Your ownership of assets on a ledger is only as valid as your trust in the custodian who has physical control of the assets.

[REVIEW AND EDIT REMANIDER OF THIS SECTION] 

We considered use cases of NFTs being owned and transacted by individuals as well as consignment to third party brokers/wallets/auctioneers (“operators”). NFTs can represent ownership over digital or physical assets. We considered a diverse universe of assets, and we know you will dream up many more:

- Physical property — houses, unique artwork
- Virtual collectables — unique pictures of kittens, collectable cards
- “Negative value” assets — loans, burdens and other responsibilities

In general, all houses are distinct and no two kittens are alike. NFTs are *distinguishable* and you must track the ownership of each one separately.

### Motivation

[REVIEW AND EDIT REMANIDER OF THIS SECTION] 

A standard interface allows wallet/broker/auction applications to work with any NFT on Aion. We provide for simple NFT smart contracts as well as contracts that track an *arbitrarily large* number of NFTs. Additional applications are discussed below.

This standard is inspired by the AIP-004 [THIS IS BEING EDITED!] token standard and builds on two [EDIT] years of experience since  ERC-20, ERC-721, ERC-1155, AIP-004 [USE MOST UP-TO-DATE REFERENCES WHEN PUBLISHING] were created. EIP-20 is insufficient for tracking NFTs because each asset is distinct (non-fungible) whereas each of a quantity of tokens is identical (fungible).

Differences between this standard and AIP-004 are examined below.

### Non-Goals
This supposes specific use cases of non-fungible tokens, however the design is created in a way to support all of the identified use cases without prescribing how they do it.

We do not intend to prevent completing non-fungible token standards from developing on Aion. We hope this standard is useful so that other authors will chose to be compatible with this if they will write their own standard.

### Success Metrics
1. Three competiing producers of tokens and three competing consumers, are all deployed to production and confirmed interoperable.
2. Reference implementation and documentation is entirely usable (results in successful compile, testing and deployment) for one (1) test subject that understands blockchain concepts but has no experience with Aion or Java.
3. Three applications implementing ERC-721 or ERC-1155 (for non-fungible use cases) and running on a production network based on Ethereum Virtual Machine are successfully ported to and deployed on Aion.

### Description

This specification comprises an interface which is adhered to by all conforming AIP-[X] producers (i.e. token contracts) and which is expected by all AIP-[X] consumers.

### Specification

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in RFC 2119.



* Provide this specification in a machine-readible way so that Java contract authors can import this and interact with any deployed NFT using the standard interface.
* Provide this specification in a machine-readible way so that Web3 authors can pull in the ABI to interact with deployed contacts.
* Possibly include those two machine-readible files as separate artifacts.



[REVIEW AND EDIT REMANIDER OF THIS SECTION] 



```
EVENTS

event Transferred(indexed priorOwner, indexed newOwner, indexed tokenid)

event Consigned(indexed owner, indexed consignee, indexed tokenid)

event Authorized(indexed account, indexed authorizee)

event Deauthorized(indexed account, indexed formerAuthorizee)

-------------------------------

function ownerOf(uint256 _tokenId) external view returns (address);
    /// @notice Find the owner of an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @param _tokenId The identifier for an NFT
    /// @return The address of the owner of the NFT
@ maybe return NULL if tokenID invalid

function consigneeOf(tokenId) returns address?
    /// @notice Get the approved address for a single NFT
    /// @dev Throws if `_tokenId` is not a valid NFT.
    /// @param _tokenId The NFT to find the approved address for
    /// @return The approved address for this NFT, or the zero address if there is none

function isAuthorizedToTransfer(owner, authorizee) BOOL
    /// @notice Query if an address is an authorized operator for another address
    /// @param _owner The address that owns the NFTs
    /// @param _operator The address that acts on behalf of the owner
    /// @return True if `_operator` is an approved operator for `_owner`, false otherwise

-----------------------------

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) external view returns (uint256);
@@ necessary?

------------------------------

transfer = function(from, to, id)
// MUST throw if TO is not operator for itself

// RATIONALE: Don't attach data. If you want to send data then use the two-step withdraw pattern and directly give the data to the recipient, in the semantiic format they want.
// RATIONALE: Check if id should be an array of ids, how is the data stored in java? How is it encoded? Is the contract calling ABI such that encoding id and [id] is the same cost?

---------------------------

    /// @notice Change or reaffirm the approved address for an NFT
    /// @dev The zero address indicates there is no approved address.
    ///  Throws unless `msg.sender` is the current NFT owner, or an authorized
    ///  operator of the current owner.
    /// @param _approved The new approved NFT controller
    /// @param _tokenId The NFT to approve
    function consign(address _approved, uint256 _tokenId) external payable;

    function authorize(address authorizee) external;

    function deauthorize(address authorizee) external;

-------------------------

Metadata? Total supply? Callbacks?
```

### Logic

Key points

* Transfer mechanism
  * Why we don't need safe AND not safe
* Function naming
  * Baggage from ERC-20, confusion with Approve
* Supports interface
  * Not needed because of AVM function selectors (but might need function name namespacing?)
* Safety mechanism
  * Refer to ERC-223 DRAFT / https://github.com/ethereum/EIPs/issues/223
  * Use pre-registration to prevent sending to contracts that cant use them
* Callbacks
  * ? Use to allow more features when sending or receiving tokens
    * Gas attack
    * Review ERC-721 and are people actually using this. Workarounds.

* Enumeration
  * Review design decisions / totalSupply and enum not actually necessary, but why?

### Risks & Assumptions
* Compatibility with concepts from ERC-721 and ERC-1155.

  



* Breakdown potential risks introduced by this proposal. How does it affect compatibility? Are there any internal or external events that could threaten the effectiveness of this proposal? Provide mitigation strategies for all listed risks and identify any assumptions.

### Test Cases
[INCLUDE REFERENCE IMPLEMENTATION WITH TEST CASES]

### Implementations
[INCLUDE REFERENCE IMPLEMENTATION]

### Dependencies
 * Identify any other AIP's, modules, libraries, or API's that are dependencies for this AIP to be implemented or achieve its value proposition.

## References

* RFC 2119 Key words for use in RFCs to Indicate Requirement Levels. https://www.ietf.org/rfc/rfc2119.txt

[REFERRED AIPS EIPS AND MORE]

### Copyright
 * All AIP’s are public domain. Copyright waiver to be linked 
 to https://creativecommons.org/publicdomain/zero/1.0/