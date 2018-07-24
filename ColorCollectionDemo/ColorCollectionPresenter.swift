//  Created by Oleg Chernyshenko on 28/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

class ColorCollectionPresenter: NSObject {
  let model: ColorModel
  let backgroundColor: UIColor = .white
  private var colors: [String] {
    return model.colors
  }
  private let cellIdentifier = "DefaultCell"

  init(with model: ColorModel) {
    self.model = model
  }

  func updateColors(completion: @escaping (() -> ())) {
    self.model.updateColors { success in
      if success {
      completion()
      } else {
        print("can't update colors")
      }
    }
  }

  func color(for index: Int) -> String? {
    guard index < model.colors.count else { return nil }
    return self.colors[index]
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
    cell.contentView.backgroundColor = UIColor.init(hexString: colors[indexPath.row]) 
    cell.contentView.layer.cornerRadius = 20.0
    return cell
  }
}

