const { ethers, network } = require("hardhat");
// const delay = require('./delay');

const ERC721Addr = require(`../deployments/${network.name}/MyERC721.json`)


async function main() {

    let [owner, second] = await ethers.getSigners();
    console.log("ethers.owner()",owner);
    console.log("ethers.second()",second);

    let myerc721 = await ethers.getContractAt("MyERC721", ERC721Addr.address, owner);

    await myerc721.transferFrom(owner.address, second.address, 1);

}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });


  // duration = 60;
  // await delay.advanceTime(ethers.provider, duration); 
  // await delay.advanceBlock(ethers.provider);