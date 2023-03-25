require("@nomicfoundation/hardhat-toolbox");
const Mnemonic = "uncover couple velvet climb predict reject eyebrow border inner fork galaxy soup";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    // goerli: {
    //   url: "https://eth-goerli.api.onfinality.io/public",
    //   accounts: [PRIVATE_KEY1,PRIVATE_KEY2],
    //   chainId: 5,
    // },
    
     mumbai: {
      url: "https://endpoints.omniatech.io/v1/matic/mumbai/public",
      accounts: {
        mnemonic: Mnemonic,
      },
      chainId: 80001,
    },
  },
  solidity: "0.8.18",
};
