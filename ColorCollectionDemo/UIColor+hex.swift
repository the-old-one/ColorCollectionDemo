//
//  UIColor+hex.swift
//  ColorCollectionDemo
//
//  Created by Oleg Chernyshenko on 17/02/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

extension UIColor {
  public convenience init?(hexString: String) {
    let r, g, b: CGFloat
    
    if hexString.hasPrefix("#") {
      let start = hexString.index(hexString.startIndex, offsetBy: 1)
      let hexColor = String(hexString[start...])

      if hexColor.count == 6 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
          g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
          b = CGFloat((hexNumber & 0x0000ff)) / 255

          self.init(red: r, green: g, blue: b, alpha: 1.0)
          return
        }
      }
    }

    return nil
  }
}
