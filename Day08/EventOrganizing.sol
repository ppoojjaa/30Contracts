// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

contract EventOrganizing{
    struct Event{
        address organizer;
        string eventname;
        uint date;
        uint price;
        uint totaltickets;
        uint remainingTickets;
        
    }
    //for creating multiple events
    mapping(uint => Event) public events;
    //hold the tickets for events  
    mapping(address => mapping(uint => uint)) public tickets;
    uint public nextId;

    function createEvent(string memory _name, uint _date, uint _price, uint _ticketCount) external{
        require(_date > block.timestamp,"Please organize the event on a later date");
        require(_ticketCount > 0,"Please add tickets to your event");
        events[nextId] = Event(
            msg.sender,
            _name,
            _date,
            _price,
            _ticketCount,
            _ticketCount
        );
        nextId++;
    }

    function buyTickets(uint _id, uint _quantity ) public payable{
        require(events[_id].date!= 0,"No such event.");
        require(block.timestamp < events[_id].date,"This event ended.");
        Event storage _event = events[_id];
        require(msg.value ==(_event.price*_quantity), "Didn't send enough money");
        require(_event.remainingTickets >= _quantity," Not enough tickets");
        _event.remainingTickets -= _quantity;
        tickets[msg.sender][_id] += _quantity; //quantity is the number of ticket's x address has purchased  
    }

    function transfer(uint _id, uint _quantity, address _to) external payable{
        require(events[_id].date!= 0,"No such event.");
        require(block.timestamp < events[_id].date,"This event ended.");
        require(tickets[msg.sender][_id] >= _quantity, "Not enough ticket holding.");
        tickets[msg.sender][_id] -= _quantity; 
        tickets[_to][_id] += _quantity;
    }
}