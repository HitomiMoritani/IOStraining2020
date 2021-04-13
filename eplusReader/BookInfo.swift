//
//  BookInfo.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/09.
//

import Foundation

class BookInfo {
    
    var bookCoverImageView: String?
    var bookTitleLabel: String?
    var authorLabel: String?
    
    init(bookCover:String, bookTitle:String, author:String) {
        self.bookTitleLabel = bookTitle
        self.bookCoverImageView = bookCover
        self.authorLabel = author
    }
}



