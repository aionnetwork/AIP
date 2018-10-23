pragma solidity 0.4.15;

/// @dev The interface a contract MUST implement if it is the delegate of some (other) interface for any address other than itself.
interface AIRDelegateInterface {
    /// @notice Indicates whether the contract implements the interface `interfaceHash` for the address `target` or not.
    /// @param target Address for which the contract will implement the interface
    /// @param interfaceHash sha3 hash of the name of the interface
    /// @return sha3("AIR_ACCEPT_MAGIC") only if the contract implements `interfaceHash` for the address `target`.
    function isDelegateFor(address target, bytes32 interfaceHash) external constant returns(bytes32);
}

contract AionInterfaceRegistry {
    /// @notice Magic value which is returned if a contract implements an interface on behalf of some other address.
    bytes32 constant AIR_ACCEPT_MAGIC = sha3("AIR_ACCEPT_MAGIC");

    mapping (address => mapping(bytes32 => address)) interfaces;
    mapping (address => address) managers;

    modifier canManage(address target) {
        require(getManager(target) == msg.sender);
        _;
    }

    /// @notice Indicates a contract is the `delegate` of `interfaceHash` for `target`.
    event InterfaceDelegateSet(address indexed target, bytes32 indexed interfaceHash, address indexed delegate);
    /// @notice Indicates `newManager` is the address of the new manager for `target`.
    event ManagerChanged(address indexed target, address indexed newManager);

    /// @notice Query if an address implements an interface and through which contract.
    /// @param target Address being queried for the delegate of an interface.
    /// @param interfaceHash sha3 hash of the name of the interface as a string.
    /// @return The address of the contract which implements the interface `interfaceHash` for `target`
    /// or `0x0` if `target` did not register this interface.
    function getInterfaceDelegate(address target, bytes32 interfaceHash) public constant returns (address) {
        return interfaces[target][interfaceHash];
    }

    /// @notice Get the manager of an address.
    /// @param target Address for which to return the manager.
    /// @return Address of the manager for a given address.
    function getManager(address target) public constant returns(address) {
        // By default the manager of an address is the same address
        if (managers[target] == address(0))
            return target;
        else
            return managers[target];
    }

    /// @notice Compute the sha3 hash of an interface given its name.
    /// @param interfaceName Name of the interface as a string.
    /// @return The sha3 hash of an interface name.
    function interfaceHash(string interfaceName) public constant returns(bytes32) {
        return sha3(interfaceName);
    }

    /// @notice Sets the contract which implements a specific interface for an address.
    /// Only the manager defined for that address can set it.
    /// (Each address is the manager for itself until it sets a new manager.)
    /// @param target Address to define the interface for.
    /// @param interfaceHash sha3 hash of the name of the interface as a string.
    /// @param delegate Address of the delegate which implements the interface `interfaceHash` for `target`.
    function setInterfaceDelegate(address target, bytes32 interfaceHash, address delegate) public canManage(target) {
        if (delegate != address(0) && delegate != msg.sender)
            require(AIRDelegateInterface(delegate).isDelegateFor(target, interfaceHash) == AIR_ACCEPT_MAGIC);
        interfaces[target][interfaceHash] = delegate;
        InterfaceDelegateSet(target, interfaceHash, delegate);
    }

    /// @notice Sets the `manager` as manager for the `target` address.
    /// The new manager will be able to call `setInterfaceDelegate` for `target`.
    /// @param target Address for which to set the new manager.
    /// @param manager Address of the new manager for `target`. (Pass `0x0` to reset the manager to `target` itself.)
    function setManager(address target, address manager) public canManage(target) {
        managers[target] = manager == target ? address(0) : manager;
        ManagerChanged(target, manager);
    }
}
