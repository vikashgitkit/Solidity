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

    const priceFetch=async(humanFormat)=>{
        const token1 = new ethers.Contract(
            fromAddress, erc20ABI, provider
        )

        const token2 = new ethers.Contract(
            toAddress, erc20ABI, provider
        )

        const decimal1 = await token1.decimals()
        //console.log("Decimal is:", decimal1)
        const amountIn = ethers.utils.parseUnits(humanFormat, decimal1).toString();

        const amountOut = await routerInstance.getAmountsOut(amountIn,{
            fromAddress,
            toAddress
        })
    }

    humanFormat="100"
    priceFetch(humanFormat)

