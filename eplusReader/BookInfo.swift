//
//  BookInfo.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/09.
//

import Foundation

class BookInfo {
    
    var bookImage: String?
    var bookTitle: String?
    var author: String?
    var url: String?
    
    init(bookCover: String, bookTitle: String, author: String, url: String) {
        self.bookTitle = bookTitle
        self.bookImage = bookCover
        self.author = author
        self.url = url
    }
}



