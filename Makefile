-include .env

#deploy

deploy-oft-to-base-sepolia:
	forge create contracts/IMO.sol:IMO --rpc-url https://base-sepolia-rpc.publicnode.com --private-key ${PRIVATE_KEY}

deploy-oft-to-bsc:
	forge create contracts/IMO.sol:IMO --rpc-url https://bsc-testnet.public.blastapi.io	--private-key ${PRIVATE_KEY}


#verify
verify-deployed-contract-base-sepolia:
	forge verify-contract --chain-id 84532 --watch ${BASE_SEPOLIA_OFT_ADDRESS} contracts/IMO.sol:IMO --etherscan-api-key ${BASE_SEPOLIA_API_KEY} --constructor-args ${BASE_SEPOLIA_CONSTRUCTOR_ABI_ENCODED}

verify-deployed-contract-bsc-testnet:
	forge verify-contract --chain-id 97 --watch ${BASE_SEPOLIA_OFT_ADDRESS} contracts/IMO.sol:IMO --etherscan-api-key ${BSC_TESTNET_API_KEY} --constructor-args ${BASE_SEPOLIA_CONSTRUCTOR_ABI_ENCODED}


#setPeer, see https://docs.layerzero.network/v2/developers/evm/technical-reference/deployed-contracts for endpoints
set-peer-on-base-sepolia:
	cast send ${BASE_SEPOLIA_OFT_ADDRESS} "setPeer(uint32,bytes32)" 40102 ${BASE_SEPOLIA_BYTES32_PEER} --rpc-url https://base-sepolia-rpc.publicnode.com --private-key ${PRIVATE_KEY}

set-peer-on-bsc-testnet:
	cast send ${BASE_SEPOLIA_OFT_ADDRESS} "setPeer(uint32,bytes32)" 40245 ${BASE_SEPOLIA_BYTES32_PEER} --rpc-url https://bsc-testnet.public.blastapi.io --private-key ${PRIVATE_KEY}

#check peer
check-base-sepolia-peer:
	cast call ${BASE_SEPOLIA_OFT_ADDRESS} "isPeer(uint32,bytes32)(bool)" 40102 ${BASE_SEPOLIA_BYTES32_PEER} --rpc-url https://base-sepolia-rpc.publicnode.com

check-bsc-testnet-peer:
	cast call ${BASE_SEPOLIA_OFT_ADDRESS} "isPeer(uint32,bytes32)(bool)" 40245 ${BASE_SEPOLIA_BYTES32_PEER} --rpc-url https://bsc-testnet.public.blastapi.io