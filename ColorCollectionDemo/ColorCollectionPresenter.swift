//
//  ColorCollectionPresenter.swift
//  ColorCollectionDemo
//
//  Created by Oleg Chernyshenko on 28/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

class ColorCollectionPresenter: NSObject {
  let model: ColorModel
  let backgroundColor: UIColor = .white
  private var colors: [UIColor] {
    return model.colors
  }
  private let cellIdentifier = "DefaultCell"

  init(with model: ColorModel) {
    self.model = model
  }

  func updateColors(completion: @escaping (() -> ())) {
    self.model.updateColors {
      completion()
    }
  }

  func color(for index: Int) -> UIColor? {
    guard index < model.colors.count else { return nil }
    return model.colors[index]
  }

  func registerCells(for collectionView: UICollectionView) {
    collectionView.register(UICollectionViewCell.self,
                            forCellWithReuseIdentifier: cellIdentifier)
  }
}

extension ColorCollectionPresenter: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return colors.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
    cell.contentView.backgroundColor = colors[indexPath.row]
    cell.contentView.layer.cornerRadius = 20.0
    return cell
  }
}

