//
//  Book.swift
//  ToyObjectPoolPattern
//
//  Created by Faiz Mokhtar on 17/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

class Book {
  let author: String
  let title: String
  let stockNumber: Int
  var reader: String?
  var checkoutCount = 0

  init(author: String, title: String, stockNumber: Int) {
    self.author = author
    self.title = title
    self.stockNumber = stockNumber
  }
}
