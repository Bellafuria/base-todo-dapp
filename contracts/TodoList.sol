// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    struct Task {
        string text;
        bool completed;
    }

    Task[] public tasks;

    event TaskAdded(uint id, string text);
    event TaskToggled(uint id, bool completed);

    function addTask(string memory _text) public {
        tasks.push(Task(_text, false));
        emit TaskAdded(tasks.length - 1, _text);
    }

    function toggleCompleted(uint _id) public {
        tasks[_id].completed = !tasks[_id].completed;
        emit TaskToggled(_id, tasks[_id].completed);
    }

    function getTaskCount() public view returns (uint) {
        return tasks.length;
    }

    function getTask(uint _id) public view returns (string memory, bool) {
        return (tasks[_id].text, tasks[_id].completed);
    }
}

