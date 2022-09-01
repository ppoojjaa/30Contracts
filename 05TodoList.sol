//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Todolist{
    event taskAdded(uint256 _TAindex, string _TAtaskName, string _TAprioritylevel);
    event taskCompleted(uint256 _TCindex, string _TCtaskName);
    address owner;
    uint256 index;

    struct Task{
        uint256 _Tindex;
        string _Tprioritylevel;
        string _TtaskName;
        bool _Tsuccess;
    }

    Task[] tasksArr;

    function addTask(string memory _taskName, string memory _prioritylevel) public{
        Task memory task = Task({
            _Tindex: index,
            _Tprioritylevel: _prioritylevel,
            _TtaskName: _taskName,
            _Tsuccess: false
        });
        tasksArr.push(task);
        
        emit taskAdded(task._Tindex, task._TtaskName, task._Tprioritylevel);
        index++;
    }

    function myTasks() public view returns(Task[] memory){
        return tasksArr;
    }

    function tasksDone(uint256 _Findex) public{
        require(tasksArr[_Findex]._Tsuccess != true, "Task is already completed");
        tasksArr[_Findex]._Tsuccess = true;
        
        emit taskCompleted(_Findex, tasksArr[_Findex]._TtaskName);
    }
}
