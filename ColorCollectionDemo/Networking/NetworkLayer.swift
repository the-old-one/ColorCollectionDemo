//  Created by Oleg Chernyshenko on 18/02/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//
import Firebase

protocol NetworkLayer {
  typealias ColorsUpdateCompletion = ([String]?, Error?) -> ()
  func updateColors(completion: @escaping ColorsUpdateCompletion)
}

class FirebaseLayer: NetworkLayer {
  func updateColors(completion: @escaping NetworkLayer.ColorsUpdateCompletion) {
    let db = Firestore.firestore()
    db.collection("colors").getDocuments { colors, error in
      guard let colors = colors else {
        completion(nil, error)
        return
      }
      let colorArray = colors.documents.flatMap { $0["hex"] as? String }
      completion(colorArray, nil)
    }
  }
}
