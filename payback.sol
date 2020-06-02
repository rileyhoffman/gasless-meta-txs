pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Payback is Ownable {
	using SafeMath for uint, uint8;

	address public paybackFund;
	//mapping(address => uint8) public yesNo;
	//event Eligible(address caller); //emitted on successful eligibility check
	event Payout(address caller, uint256 amount);

	constructor (address _paybackFund) {
		paybackFund = _paybackFund;
	}//constructor to establish contract owner, and set owner function

	struct Payout {
		address caller;
		uint256 amount;
	}

	Payout[] public payouts; //reads this to determine if caller is eligible for payout

	function click(address _caller) {
		address success = null;
		for (uint i =0; i< payouts.length; i++) {
			if (payouts[i] = msg.sender) {
				success = msg.sender;
			}
		}
		require(_caller.balance == 0 ether && success == msg.sender) {
		_value = tx.gasprice;
		payout(_value);
		}
	}
	/*figure out if it makes sense to somehow use view functions to check the 2 if statements or at least check the payouts array from the front end*/



	/*function eligibilityCheck() external view returns (bool success) {
		require(yesNo[msg.sender] == 0);
		return true;
		emit Eligible(msg.sender);// uses true/false to see whether function caller can have some eth
	}*/

	function payout (uint _value) private/internal {
		_transfer(paybackFund, msg.sender, _value + tx.gasprice);
		payouts.push(msg.sender, _value + tx.gasprice);
		emit Payout(msg.sender, _value + tx.gasprice);
	}
}