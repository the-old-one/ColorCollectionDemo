//  Created by Oleg Chernyshenko on 17/02/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

class ColorModelRemote: ColorModel {
  var colors: [String] = []
  let networkLayer: NetworkLayer

  init(with networkLayer: NetworkLayer) {
    self.networkLayer = networkLayer
  }

  func updateColors(completion: @escaping ColorModel.UpdateColorsCompl) {
    networkLayer.updateColors { [weak self] colors, error in
      guard let colors = colors else {
        completion(false)
        return
      }
      self?.colors = colors
      completion(true)
    }
  }
}
