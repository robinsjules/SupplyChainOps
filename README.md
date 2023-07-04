# Smart contract for partial supply chain operations
This is a smart contract that manages businesses' inventory systems and tracks order shipment and delivery done by couriers to customers. The code implements only a partial segment of the supply chain and focuses more on the logistical aspect.

## Deployment
In order to deploy the smart contract, it is assumed that you have a MetaMask wallet connected to a test network such as Mumbai.
<br><br>Step-by-step guide:

1. Open the <a href="https://github.com/robinsjules/SupplyChainOps/blob/main/SupplyChainOps.sol">SupplyChainOps.sol</a> file in Remix IDE.
2. Using the Solidity Complier, compile the smart contract file.
3. In the Deploy & Run Transactions tab, use Remix VM (Shanghai) as the environment. Use your account and leave the default gas limit as is.
4. Press Deploy.

You have now successfully compiled and deployed the smart contract. Now, we will move on to the test cases in order to run transactions.

## Running transactions
Here are a few ways to test the smart contract:
<br><br><b>1. addProduct & getProductQuantity</b>
<br>First, add a product in the inventory by using the addProduct function. The productId can be set to 123
while quantity can be set to 50. Press transact to run this transaction. The terminal will show you if the transaction was successful.
<i>You should face no errors with this!</i>
You can also check if the function worked by using the getProductQuantity function. Input 123 as the productId and press call. The output will display 50 in the terminal.
<br><br><b>2. placeOrder</b>
<br>The placeOrder function allows you to order 1 quantity for a product. Simply input which productId you would like to order.

## For future applications
- <b>Update Product Details:</b> Aside from the addProduct function, an update function would be useful in case of wrong intial inputs (i.e., misspelling).
- <b>Product Categorization:</b> A feature to categorize products, enabling better organization and filtering options within the inventory. This could include adding categories or tags to products and allowing users to search or filter products based on these categories.
- <b>Email Notifications:</b> To improve the LowSupplyNotification event, implement an actual notification system to business owners through Chainlink Functions or similar.
- <b>Front-end Interface:</b> The application would be user-friendly if a user interface were implemented using JavaScript frameworks.
<br><br><i>Some functions are in the midst of being debugged due to transactions being reverted to their initial states.


