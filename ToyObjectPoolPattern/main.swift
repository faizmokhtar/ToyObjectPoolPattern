//
//  main.swift
//  ToyObjectPoolPattern
//
//  Created by Faiz Mokhtar on 17/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

var queue = DispatchQueue(label: "workQueue", attributes: .concurrent)
var group = DispatchGroup()

print("Starting...")

for i in 1...20 {
  queue.async(group: group, execute: {
    let book = Library.checkoutBook(reader: "reader#\(i)")
    if book != nil {
      Thread.sleep(forTimeInterval: Double(arc4random() % 2))
      Library.returnBook(book: book!)
    }
  })
}

_ = group.wait(timeout: .distantFuture)

print("All blocks complete")

Library.printReport()
