const hre = require("hardhat");

async function main() {

  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const Elems = await hre.ethers.getContractFactory("Elems");
  const elems = await Elems.deploy();
  await elems.deployed();
  console.log("Token1 contracts:", elems.address);

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });