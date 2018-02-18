//
//  ColorModel.swift
//  ColorCollectionDemo
//
//  Created by Oleg Chernyshenko on 28/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import GameplayKit

protocol ColorModel {
  typealias UpdateColorsCompl = (_ success: Bool) -> ()
  var colors: [String] { get }

  func updateColors(completion: @escaping UpdateColorsCompl)
}

class ColorModelLocal: ColorModel {
  var colors: [String] = []

  func updateColors(completion: @escaping UpdateColorsCompl) {
    let random = GKRandomSource.sharedRandom()
    self.colors = random.arrayByShufflingObjects(in: colorStorage) as! [String]
    completion(true)
  }

  private let colorStorage: [String] = [
    "#e74c3c",
    "#f1c40f",
    "#1abc9c",
    "#9b59b6",
    "#3498db",
    "#2ecc71",
    ]
}

