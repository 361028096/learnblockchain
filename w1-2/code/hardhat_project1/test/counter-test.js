const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Counter", function () {
  it("Should return the result to the get method", async function () {
    var Counter = await ethers.getContractFactory("Counter");
    var counterInstance = await Counter.deploy("10");
    await counterInstance.deployed();
    let value = await counterInstance.get();
    console.log("---------------------",value);
    expect(await counterInstance.get()).to.equal(10);
  });
});
