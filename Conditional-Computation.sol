pragma solidity ^0.8.0;

contract ConditionalComputation {
    address public owner;

    // Events to log computations
    event ComputationTriggered(string computationName, uint256 result);

    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can execute this function.");
        _;
    }

    // Function to trigger computations based on predefined conditions
    function triggerComputation(uint256 input) public onlyOwner returns (uint256) {
        uint256 result;

        if (input > 100) {
            result = computationA(input);
            emit ComputationTriggered("Computation A", result);
        } else if (input > 50) {
            result = computationB(input);
            emit ComputationTriggered("Computation B", result);
        } else {
            result = computationC(input);
            emit ComputationTriggered("Computation C", result);
        }

        return result;
    }

    // Specific computation when input > 100
    function computationA(uint256 input) internal pure returns (uint256) {
        // Example computation logic
        return input * 2;
    }

    // Specific computation when input > 50
    function computationB(uint256 input) internal pure returns (uint256) {
        // Example computation logic
        return input + 50;
    }

    // Specific computation when input <= 50
    function computationC(uint256 input) internal pure returns (uint256) {
        // Example computation logic
        return input - 10;
    }
}
