//
//  Pool.swift
//  ToyObjectPoolPattern
//
//  Created by Faiz Mokhtar on 17/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

class Pool<T> {
  private var data = [T]()
  private let arrayQueue = DispatchQueue(label: "arrayQueue")
  private let semaphore: DispatchSemaphore

  init(items: [T]) {
    data.reserveCapacity(data.count)
    for item in items {
      data.append(item)
    }
    semaphore = DispatchSemaphore(value: items.count)
  }

  func getFromPool() -> T? {
    var result: T?
    if semaphore.wait(timeout: .distantFuture).hashValue == 0 {
      arrayQueue.sync {
        result = self.data.remove(at: 0)
      }
    }
    return result
  }

  func returnToPool(item: T) {
    arrayQueue.async {
      self.data.append(item)
      self.semaphore.signal()
    }
  }
}
