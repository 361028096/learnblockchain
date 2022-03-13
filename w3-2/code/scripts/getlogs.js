const { ethers, network } = require("hardhat");

const ERC721Addr = require(`../deployments/${network.name}/MyERC721.json`)

async function parseTransferEvent(event) {
    const TransferEvent = new ethers.utils.Interface(["event Transfer(address indexed from,address indexed to,uint256 value)"]);
    let decodedData = TransferEvent.parseLog(event);
    console.log("from:" + decodedData.args.from);
    console.log("to:" + decodedData.args.to);
    console.log("value:" + decodedData.args.value.toString());
}

async function main() {
    let [owner, second] = await ethers.getSigners();
    let myerc721 = await ethers.getContractAt("MyERC721",
        ERC721Addr.address,
        owner);

    let filter = myerc721.filters.Transfer()
    filter.fromBlock = 1;
    filter.toBlock = 10;


    // let events = await myerc721.queryFilter(filter);
    let events = await ethers.provider.getLogs(filter);
    for (let i = 0; i < events.length; i++) {
        // console.log(events[i]);
        parseTransferEvent(events[i]);

    }
}

main()