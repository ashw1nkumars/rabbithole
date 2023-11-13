// SPDX-License-Identifier: MIT
pragma solidity >=0.0.0 <0.9.0;

contract Twitter {
    struct Tweet {
        uint id;
        address author;
        string content;
        uint timestamp;
    }

    Tweet[] private _tweets;

    mapping(address => uint[]) private _tweetsByAuthor;

    function createTweet(string memory _content) external {
        uint _id = _tweets.length;
        uint _timestamp = block.timestamp;

        Tweet memory _tweet = Tweet(_id, msg.sender, _content, _timestamp);

        _tweets.push(_tweet);
        _tweetsByAuthor[msg.sender].push(_id);
    }
}
