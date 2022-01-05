pragma solidity ^0.8.7;

import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Assignment {
    address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    IUniswapV2Router02 public uniswapRouter;
    mapping(address => uint) public balance;
    uint[] public amounts;
    constructor() {
        uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
    }

    function convertTokenToETH(address cryptoToken, uint quantity) public returns(uint) {
        //deadline can be passed from frontend
        uint deadline = block.timestamp + 300;
        IERC20 token = IERC20(cryptoToken);
        token.transferFrom(msg.sender, address(this), quantity);
        token.approve(UNISWAP_ROUTER_ADDRESS, quantity);
        amounts = uniswapRouter.swapExactTokensForETH(quantity, 0, getPathForTokenToETH(cryptoToken), address(this), deadline);
        //adding received ether as balance of sender of transaction
         balance[msg.sender] = amounts[amounts.length - 1];
         return amounts[amounts.length-1];
    }

    function getPathForTokenToETH(address cryptoToken) private view returns (address[] memory) {
        address[] memory path = new address[](2);
        path[0] = cryptoToken;
        path[1] = uniswapRouter.WETH();
        return path;
  }

    function withdrawETH() public {
        payable(msg.sender).transfer(balance[msg.sender]);
        balance[msg.sender]=0;
    }

    receive() payable external {
    }

}
