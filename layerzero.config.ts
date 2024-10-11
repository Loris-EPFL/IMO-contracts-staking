import { EndpointId } from '@layerzerolabs/lz-definitions'

import type { OAppOmniGraphHardhat, OmniPointHardhat } from '@layerzerolabs/toolbox-hardhat'


const baseContract: OmniPointHardhat = {
    eid: EndpointId.BASE_MAINNET,
    contractName: 'IMO',
}

const bscContract: OmniPointHardhat = {
    eid: EndpointId.BSC_MAINNET,
    contractName: 'IMO',
}



const config: OAppOmniGraphHardhat = {
    contracts: [
        {
            contract: bscContract,
        },
        {
            contract: baseContract,
        },
    ],
    connections: [
        {
            from: bscContract,
            to: baseContract,
        },
        {
            from: bscContract,
            to: baseContract,
        },
    ],
}

export default config
