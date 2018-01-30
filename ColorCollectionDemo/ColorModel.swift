//
//  ColorModel.swift
//  ColorCollectionDemo
//
//  Created by Oleg Chernyshenko on 28/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit
import GameplayKit

class ColorModel {
  typealias UpdateColorsCompl = () -> ()
  var colors: [UIColor] = []

  func updateColors(completion: @escaping UpdateColorsCompl) {
    let random = GKRandomSource.sharedRandom()
    self.colors = random.arrayByShufflingObjects(in: colorStorage) as! [UIColor]
    completion()
  }

  private let colorStorage: [UIColor] = [
    .appleRed,
    .appleGreen,
    .appleBlue,
    .appleOrange,
    .appleTeal,
    .applePurple,
    ]
}
