const { expect } = require('chai');


describe('Farm contract', () => {
    
    let Elems, elems, owner, addr1, addr2;

    beforeEach(async () => {
        Elems = await hre.ethers.getContractFactory("Elems");

        elems = await Elems.deploy();

        [owner, addr1, addr2] = await hre.ethers.getSigners();


    });

    describe("Tests", function () {

        it("Should mint", async function () {
            await elems.mintNFT(owner.address, "link");
            await elems.mintNFT(owner.address, "link");
            
            expect(await elems.balanceOf(owner.address)).to.equal("2");
        });

        it("Should check tokenURI", async function () {
            await elems.mintNFT(owner.address, "link");
            
            expect(await elems.tokenURI(1)).to.equal("link");
        });

    });

});