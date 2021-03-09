# Unit 18 Blockchain Homework

For this assignment, I set up a custom testnet blockchain, I sent a test transaction, and I created a repository. Here I will detail how the custom blockchain works. The assignment requested that we set up a POA blockchain, however I was unable to get the nodes to reliably unlock themselves, so I opted to set up a POW blockchain as I could reliably get that network working.

## Getting the Blockchain Started

After you've installed all of the blockchain tools correctly, make sure to clone this repository as is into your blockchain tools folder.  In order to get this blockchain started, one must open a gitbash command in their blockchain-tools folder, which will also be the home folder for all of the files in this repository.  After this, you must initialize the nodes with the zbankprivate.json. In order to accomplish this, type :

./geth init zbankprivate.json --datadir node 1
./geth init zbankprivate.json --datadir node 2

into your gitbash. If any errors spring back at you, then you'll have to delete the geth folders in each node's folder. This can be done either by typing:

Rm - Rf node1/geth node2/geth

into your gitbash, or by removing the folders within the windows finder. After you've successfully managed to initialize each node, it's time to get the first node mining. In order to start mining, type:

./geth --datadir node1 --mine --minerthreads 1

Into the same gitbash you used to initialize the nodes.  Before continuing, be sure to copy the enode address that the first node shoots out and paste it somewhere safe. Now open up a second gitbash in the blockchain-tools folder, and type in:

./geth --datadir node2 --port 30304 --rpc --bootnodes "<your enode here>" --ipcdisable
  
 Be sure to replace the <your enode here> with the enode you copied in the last step.
  
 At this point, node 1 will be mining, and node 2 will allow you to interact with mycrypto in order to start transacting.

## Trading within the blockchain testnet

At this point, node 1 should be accruing ethereum within the test network. In order to transact, we're going to be opening up mycrypto. You will first need to configure the network in order to start running transactions. First create a new custom network named zbank private, set network to custom, set node name to zbankprivate, network name to zbankprivate, currency to ethereum and use port 335 in order to be able to interact with the zbankprivate network, additionally, use http://127.0.0.1:8545 as your URL, as that is your machine's default RPC port. Afterwards, open up the first node's keystore file in view & send. (The keystore file can be found in node1/keystore of this repository) Use the password that can be found in zbankprivate/node1.txt of this repository. At this point you should be able to send ethereum to node2 by using the public address found in zbankprivate/node2.txt of this repository. You can log in to check that the second node has received the ethereum by mimicing the steps above for node 2. Additionally, you can record the transaction's hash id and search for it to check its status.

