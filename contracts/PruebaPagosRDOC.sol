// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

//import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract PruebaPagosRDOC  {
    //using SafeERC20 for IERC20;

    // IERC20 rdoc_token = 0xC3De9f38581F83e281F260D0ddBAac0E102Ff9F8;

    address payable public redefine_address;
    uint public fee_percent;
    uint public payment_percent;
    address payable public recipient;

    event TransferReceived(address _from, uint _amount, address _to, uint _transferred);
    
    constructor(address payable _addrs, uint _fee, uint _payment) {
        redefine_address = _addrs;
        fee_percent = _fee;
        payment_percent = _payment;
    }
    
    function make_payment(address payable _address) payable external {
        recipient = _address;
        uint256 fee = msg.value / 100 * fee_percent;
        uint256 value = msg.value / 100 * payment_percent;

        redefine_address.transfer(fee);
        recipient.transfer(value);

        emit TransferReceived(msg.sender, msg.value, recipient, value);
    }

}

