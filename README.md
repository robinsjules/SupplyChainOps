# Smart contract for partial supply chain operations
This is a smart contract that manages businesses' inventory systems and tracks order shipment and delivery done by couriers to customers. The code implements only a partial segment of the supply chain and focuses more on the logistical aspect.

## Deployment
In order to deploy the smart contract, it is assumed that you have a MetaMask wallet connected to a test network such as Mumbai.
<br><br>Steps to deploy and run transactions:

1. Open the <a href="https://github.com/robinsjules/SupplyChainOps/blob/main/SupplyChainOps.sol">SupplyChainOps.sol</a> file in Remix IDE.
2. Using the Solidity Complier, compile the smart contract file.
3. In the Deploy & Run Transactions tab, use Remix VM (Shanghai) as the environment. Use your account and leave the default gas limit as is.
4. Press Deploy.

You have now successfully compiled and deployed the smart contract. Now, we will move on to the test cases in order to run transactions.

## Testing
Test cases will soon be released.

## Features
Explanations of functions will soon be released.

## For future applications
- <b>Update Product Details:</b> Aside from the addProduct function, an update function would be useful in case of wrong intial inputs (i.e., misspelling).
- <b>Product Categorization:</b> A feature to categorize products, enabling better organization and filtering options within the inventory. This could include adding categories or tags to products and allowing users to search or filter products based on these categories.
- <b>Email Notifications:</b> To improve the LowSupplyNotification event, implement an actual notification system to business owners through Chainlink Functions or similar.
- <b>Front-end Interface:</b> The application would be user-friendly if a user interface were implemented using JavaScript frameworks. 
