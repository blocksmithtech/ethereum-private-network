geth --testnet \
     --rpc --rpcapi "eth,net,web3,personal" --rpcaddr 0.0.0.0 --rpcport 8545 --rpccorsdomain '*' \
     --ws --wsapi "eth,net,web3,personal" --wsaddr 0.0.0.0 --wsport 8546 --wsorigins '*'
