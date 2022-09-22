pragma solidity ^0.6.4;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        //you can add city details if you want
    }


    mapping(uint256 => City) public cities; //mapping city Id with the City ctruct - cityId should be uint256
    mapping(address => bool) hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    uint256 public cityCount = 0; // number of city added
    constructor() public {
        owner = msg.sender;
        cities[0].cityName = "ktm";
        cities[0].vote = 0;
        cities[1].cityName = "bkt";
        cities[1].vote = 0;
        cityCount = 2;
    //TODO set contract caller as owner
    //TODO set some intitial cities.
    }
 
 
    function addCity(string memory city_name) public {
      //  TODO: add city to the CityStruct
      require(msg.sender == owner, "You are not owner of this contract");

      cities[cityCount].cityName = city_name;
      cities[cityCount].vote = 0;
      cityCount ++;      
    }
    
    function vote(uint256 city) public {
        //TODO Vote the selected city through cityID
        cities[city].vote += 1;
    }
    function getCity(uint256 city) public view returns (string memory) {
        // TODO get the city details through cityID
        return (cities[city].cityName);
    }
    function getVote(uint256 city) public view returns (uint256) {
        // TODO get the vote of the city with its ID
        return cities[city].vote;
    }
}