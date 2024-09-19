const erc20ABI=["function decimals() public view returns(uint8)"]

//it will return the address of liquidity provider contract
//0x58F876857a02D6762E0101bb5C46A8c1ED44Dc16
const factoryABI=["function getPair(address tokenA, address tokenB) external view returns (address pair)"]

const paiABI=[
    "function token0() external view returns (address)",
    "function token1() external view returns (address)",
    "function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast)"
]

const routerABI=[
    "function getAmountsOut(uint amountIn, address[] memory path) public view returns (uint[] memory amounts)"
]

module.exports={
    erc20ABI,
    factoryABI,
    paiABI,
    routerABI
}