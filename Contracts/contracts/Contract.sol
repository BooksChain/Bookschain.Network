// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract BooksChain {
    event AddedBook(Book);

    Book[] public _books;

    struct Book {
        int _id;
        string _name;
        address _author;
        string _content;
    }

    constructor() {
        _books = new Book[](0);
    }

    function GenerateId() public returns(int) {
        int id = 1;

        for (uint i = 0; i < _books.length; i++) {
            id++;
        }

        return id;
    }

    function AddBook(string memory name, string memory content) public {
        Book memory book = Book({_id: GenerateId(), _author:msg.sender, _name: name, _content: content});
        _books.push(book);

        emit AddedBook(book);
    }
}
