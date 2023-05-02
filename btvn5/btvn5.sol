/*Viết code liên quan , tương ứng đến mỗi  key ở dưới . nộp bằng link github  
Variables, Datatype , Constant, Wei ,If/else, For, While Loop ,Mapping ,Array ,Enum ,Struct ,Data location,
Function , View and pure, Function modifier, Require, Revert, Assert, Constructor, Interface, Inheritance*/
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock{
    uint public unlockTime;
    address payable public owner;

    event Withdrawal(uint amount, uint when);

    constructor(uint _unlockTime) payable {
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );
        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    function withdraw() public {
        // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

        require(block.timestamp >= unlockTime, "You can't withdraw yet");
        require(msg.sender == owner, "You aren't the owner");

        emit Withdrawal(address(this).balance, block.timestamp);

        owner.transfer(address(this).balance);
    }
}
// Variable: 3 type (local, state and global)
contract Variable{
    string public say = "Hello";
    uint public numbers = 123;
    function Run() public view{
        uint x = 1;
        uint ts = block.timestamp;
        address sender = msg.sender;
    }
}
// Datatype basic
contract DataType{
    string public word = "Good bye!";
    uint num = 123;
    bool check = true;
    address public constant myAccount = 0x038008d93E3d153eF7a6Df2e555c2367cd79f83a;
}
//constant
contract constants{
    string public constant pass = '123456';
}
//Wei and Ether : 10^18 wei = 1 Either
contract EtherumUnits{
    uint public onewei = 1 wei;
    uint public oneEther = 1 ether;
}
//if else
contract Check{
    function Checkk(uint x) public pure returns(uint){
        if(x % 2 == 0){
            return 1;
        }else{
            return 0;
        }
    }
}
//For and while
contract Loop{
    function ForAndWhile() public pure{
        for(uint i = 0 ; i < 10 ; i++){
            if(i % 2 == 0) continue;
            if(i % 7 == 0) break;
        }
        uint j = 0;
        while(j != 10){
            j++;
        }
    }
}
//Mapping
contract Mapping{
    // map 1 chieu
    mapping (address => uint) public Map;
    function setMap(address x, uint i) public{
        Map[x] = i;
    }

    function getMap(address x) public view returns(uint){
        return Map[x];
    }

    function removeMap(address x) public{
        delete Map[x];
    }
    // map 2 chieu
}

contract Maping2{
    mapping (address => mapping(uint => bool)) public NestMap;
    function setNestMap(address x, uint i, bool check) public{
        NestMap[x][i] =  check;
    }

    function getNestMap(address x, uint i) public view returns (bool){
        return NestMap[x][i];
    }

    function removeNestMap(address x, uint i) public{
        delete NestMap[x][i];
    }
}
// Array
contract Array{
    uint [] public arr = [1,2,3,4];
    uint [] public arr1;
    function setArray(uint i) public{
        arr.push(i);
    }

    function removeElement(uint _index) public{
        delete arr[_index];
    }

    function getArray() public view returns (uint[] memory){
        return arr;
    }

    function pop() public {
        arr.pop();
    }

    function lengthOfArr() public view returns (uint){
        return arr.length;
    }

    function create() external pure{
        uint[] memory newarr = new uint[](5);
    }

}

contract RemovebyIndex{
    uint[] public arr;
    function remove(uint _index) public{
        require(_index >= arr.length, "vi tri khong hop le");
        for(uint i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() public{
        arr = [1,2,3,4,5];
        remove(0);
        assert(arr.length == 4);
        assert(arr[0] == 2);
        assert(arr[1] == 3);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
    }
}

contract RemovebyReplaceLastElement{
    uint[] public arr;
    function remove(uint _index) public{
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }
    function test() public{
        arr = [1,2,3,4];
        remove(0);
        assert(arr[0] == 4);
        assert(arr[1] == 2);
        assert(arr[2] == 3);
    }
}
//Enum
contract Enum{
    enum Status{
        Created,
        Started,
        Closing,
        Closed
    }
    Status status;
    function get() public view returns(Status){
        return status;
    }
    function set(Status _status) public{
        status = _status;
    }
    function Created() public{
        status = Status.Created;
    }
    function reset() public{
        delete status;
    }
// co the import cac tep da co san vao trong bang cach import "duong dan";
}
//Struct

contract Struct{
    struct Todo{
        string name;
        bool check;
    }
    Todo[] info;
    function set(string calldata _name) public {
        info.push(Todo(_name, false));
        //key mapping value
        info.push(Todo({name:_name, check: false}));
        // khoi tao struct sau do cap nhat
        Todo memory newinfo;
        newinfo.name = _name;
        info.push(newinfo);// dua vao mang struct
    }
    // update struct ???
}
//data location
// Storage:1 bien luu tru tren blockchain
// Memory: Nam trong bien bo nho va duoc khoi tao khi dang goi toi, bi xoa khi ham thuc thi ket thuc
//calldata: vi tri du lieu chua cac doi so cua ham
contract DataLocation{
    struct Structs{
        uint dirr;
    }
    uint[] public arr;
    mapping(uint => address) map;
    mapping(uint => Structs) myStructs;
    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        Structs storage myStruct
    ) internal {

    }

    function g(uint[] memory _arr) public returns(uint[] memory){}
    function h(uint[] calldata _arr) internal{}

    function f() public{
        _f(arr, map, myStructs[0]);
        Structs storage newstruct = myStructs[0];
        Structs memory memStruct = Structs(0);
    }
}
// Function
//view and pure
//Function modifier
contract FunctionModifier{
    address owner;
    bool looked;
    uint account = 100;
    constructor(){
        owner = msg.sender;
    }

    modifier CheckOnlyOwner(address _owner){
        require(msg.sender != _owner, "It's not owner!");
        _;
    }

    modifier validAddress(address _add){
        require(_add != address(0), "Invalid address!");
        _;
    }

    function Verify(address _newOwner) public CheckOnlyOwner(_newOwner) validAddress(_newOwner){
        owner = _newOwner;
    }

    modifier duplicate(){
        require(!looked, "transaction has done!");
        looked = true;
        _;
        looked = false;
    }

    function transaction(uint fee) public duplicate(){
        account -= fee;
    }
}
//Revert
contract Revert{
    uint public myNumber;
    function setAccount(uint _number) public{
        if(_number == 0) revert("the account number cannot be zero!");
        myNumber = _number;
    }
}
//Constructor
contract X{
    string public name;
    constructor(string memory _name){
        name = _name;
    }
}

contract Y{
    string public text;
    constructor(string memory _text){
        text = _text;
    }
}

// cac cach khoi tao hop dong cha

contract Z is X("input here"), Y("input here"){}
contract T is X, Y{
    constructor(string memory _name, string memory _text) X(_name) Y(_text){}
}
contract E is X, Y{
    constructor() X("X is") Y("Y is"){}
}
//Inheritance
contract A{
    function foo() public pure virtual returns(string memory){
        return "A";
    }
}

contract B is A{
    function foo() public pure virtual override returns (string memory){
        return "B";
    }
}

contract C is A{
    function foo() public pure virtual override returns (string memory){
        return "C";
    }
}

contract D is A, B{
    function foo() public pure override(A,B) returns (string memory){
        super.foo();
    }
}
//Interface
contract Counter{
    uint public count;
    function getCounter() public view returns(uint){
        return count;
    }
}

interface InterfaceCounter{
    function getCounter() external view returns(uint);
}

contract CallData{
    InterfaceCounter private counter;
    constructor(address _add){
        counter = InterfaceCounter(_add);
    }
    function get() public view returns(uint){
        return counter.getCounter();
    }
}