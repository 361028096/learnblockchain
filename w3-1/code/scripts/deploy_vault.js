const hre = require("hardhat");
const { writeAddr } = require('./artifact_log.js');
const MyERC20Addr = require(`../deployments/${network.name}/MyERC20.json`)

async function main() {
  // await hre.run('compile');

  const Vault = await hre.ethers.getContractFactory("Vault");
  const vault = await Vault.deploy(MyERC20Addr.address);

  const token = await Vault.deploy(MyERC20Addr.address);

  await token.deployed();

  console.log("Vault deployed to:", token.address);
  await writeAddr(token.address, "Vault", network.name)
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
