const ethers = require('ethers');
const{factoryAddress,
    routerAddress,
    fromAddress,
    toAddress} = require("./AddressList");

    const {
        erc20ABI,
    factoryABI,
    paiABI,
    routerABI
    } = require("./AbiInfo")

    const provider = new ethers.providers.JsonRpcProvider(
        "https://bsc-dataseed1.binance.org/"
    )

    const factoryInstance = new ethers.Contract(
        factoryAddress, factoryABI, provider
    )
    console.log("factory instance is:", factoryInstance);

    const routerInstance = new ethers.Contract(
        routerAddress, routerABI, provider
    )
