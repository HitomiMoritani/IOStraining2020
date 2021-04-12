//
//  BookInfo.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/09.
//

import Foundation

class BookInfo {
    
    var bookCover: String?
    var bookTitle: String?
    var author: String?
    
    init(bookCover:String, bookTitle:String, author:String) {
        self.bookTitle = bookTitle
        self.bookCover = bookCover
        self.author = author
    }
}




