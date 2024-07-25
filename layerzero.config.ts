import { EndpointId } from '@layerzerolabs/lz-definitions'

import type { OAppOmniGraphHardhat, OmniPointHardhat } from '@layerzerolabs/toolbox-hardhat'


const baseSepoliaContract: OmniPointHardhat = {
    eid: EndpointId.BASESEP_V2_TESTNET,
    contractName: 'IMO',
}

const bscTestnetContract: OmniPointHardhat = {
    eid: EndpointId.BSC_TESTNET,
    contractName: 'IMO',
}



const config: OAppOmniGraphHardhat = {
    contracts: [
        {
            contract: bscTestnetContract,
        },
        {
            contract: baseSepoliaContract,
        },
    ],
    connections: [
        {
            from: bscTestnetContract,
            to: baseSepoliaContract,
        },
        {
            from: baseSepoliaContract,
            to: bscTestnetContract,
        },
    ],
}

export default config
