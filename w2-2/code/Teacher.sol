// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Score {

    address public teacher;

    mapping(address => uint) scores;
    
    modifier onlyTeacher{
        require(msg.sender == teacher, "not teacher!");
        _;
    }

    function addteacher(address _teacher) public {
        teacher = _teacher;
    }

    function updateScore(address _student, uint _score) external onlyTeacher {
        require(_score <= 100, "score error");
        scores[_student] = _score;
    }

    function getScore(address _student) public view returns (uint) {
        return scores[_student];
    }

}

interface IScore {
    function updateScore(address _student, uint _score) external;
}

contract Teacher {
    address public teacher;

    constructor() {
        teacher = address(this);
    }

    function updateStudentScore(address _student, uint _score) public {
        IScore(_student).updateScore(_student, _score);
    } 
}