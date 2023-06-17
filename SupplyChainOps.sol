// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract SupplyChainOperations {

    address contractOwner;

    constructor(){
        contractOwner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == contractOwner);
        _; 
    }

    modifier onlyAuthorizedCourier() {
        require(courierWhitelist[msg.sender], "Courier not authorized");
        _;
    }
    
    struct Product {
        uint quantity;
        uint orderCount;
    }

    struct Order {
        uint productId;
        bytes32 orderId;
        uint timestampPlaced;
        uint timestampShipped;
        uint timestampInTransit;
        uint timestampDelivered;
        address courier;
        string orderStatus;
    }
    
    mapping(uint => Product) private inventory;
    mapping(bytes32 => Order) private orders;
    mapping(address => bool) private courierWhitelist;


    event ProductAdded(uint productId, uint quantity);
    event LowSupplyNotification(uint productId, uint quantity);
    event OrderPlaced(uint productId, bytes32 orderId, uint timestampPlaced);
    event OrderShipped(bytes32 orderId, uint timestampShipped);
    event OrderInTransit(bytes32 orderId, uint timestampInTransit);
    event OrderDelivered(bytes32 orderId, uint timestampDelivered);
    
    function addProduct(uint productId, uint quantity) public onlyOwner {
        require(inventory[productId].quantity == 0, "Product with the same ID already exists");
        
        Product storage product = inventory[productId];
        product.quantity = quantity;
        
        emit ProductAdded(productId, quantity);
        
        if (quantity < 100) {
            emit LowSupplyNotification(productId, quantity);
        }
    }
    
    function placeOrder(uint productId) external {
        require(inventory[productId].quantity > 0, "Product does not exist");
        
        Product storage product = inventory[productId];
        product.quantity--;
        product.orderCount++;
        
        bytes32 orderId = generateOrderId(productId, block.timestamp);
        
        Order storage order = orders[orderId];
        order.productId = productId;
        order.orderId = orderId;
        order.timestampPlaced = block.timestamp;
        
        emit OrderPlaced(productId, orderId, order.timestampPlaced);
    }

    function generateOrderId(uint256 productId, uint256 timestamp) private pure returns (bytes32) {
        return keccak256(abi.encodePacked(productId, timestamp));
    }
    
    function shipOrder(bytes32 orderId) public onlyOwner {
        Order storage order = orders[orderId];
        order.timestampShipped = block.timestamp;
        
        emit OrderShipped(orderId, order.timestampShipped);
    }

    function authorizeCourier(address courier) public onlyOwner {
        require(!courierWhitelist[courier], "Courier already authorized");

        courierWhitelist[courier] = true;
    }

    function revokeCourierAuthorization(address courier) public onlyOwner {
        require(courierWhitelist[courier], "Courier not authorized");

        courierWhitelist[courier] = false;
    }

    function markInTransit(bytes32 orderId) external onlyAuthorizedCourier {
        Order storage order = orders[orderId];
        order.timestampInTransit = block.timestamp;
        
        emit OrderInTransit(orderId, order.timestampInTransit);
    }
    
    function markDelivered(bytes32 orderId) external onlyAuthorizedCourier {
        Order storage order = orders[orderId];
        order.timestampDelivered = block.timestamp;
        
        emit OrderDelivered(orderId, order.timestampDelivered);
    }

    function getProductQuantity(uint productId) public onlyOwner view returns (uint) {
        return inventory[productId].quantity;
    }
    
    function getOrderCount(uint productId) public onlyOwner view returns (uint) {
        return inventory[productId].orderCount;
    }
}