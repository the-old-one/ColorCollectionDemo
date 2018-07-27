//  Created by Oleg Chernyshenko on 28/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

class ColorCollectionViewController: UIViewController {
  let presenter: ColorCollectionPresenter!
  var collectionView: UICollectionView!

  init(with presenter: ColorCollectionPresenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = presenter.backgroundColor
    setupCollectionView()
    presenter.updateColors { [weak self] in
      self?.collectionView.reloadData()
    }
  }

  func setupCollectionView() {
    collectionView = UICollectionView(frame: self.view.frame,
                                      collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = presenter
    collectionView.refreshControl = refreshControl
    presenter.registerCells(for: collectionView)
    self.view.addSubview(collectionView)
  }

  let layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    let insetLeft: CGFloat = 5.0
    let insetRight: CGFloat = 5.0
    layout.sectionInset = UIEdgeInsets(top: 10,
                                       left: insetLeft,
                                       bottom: 5.0,
                                       right: insetRight)
    let itemWidth = UIScreen.main.bounds.width / 2 - (insetLeft + insetRight)
    layout.itemSize = CGSize(width: itemWidth, height: 300.0)
    return layout
  }()

  let refreshControl: UIRefreshControl = {
    let refresh = UIRefreshControl()
    refresh.addTarget(self,
                      action: #selector(ColorCollectionViewController.refreshColors),
                      for: .valueChanged)
    return refresh
  }()

  @objc func refreshColors() {
    presenter.updateColors { [weak self] in
      DispatchQueue.main.async {
        self?.collectionView.reloadData()
        self?.refreshControl.endRefreshing()
      }
    }
  }
}

extension ColorCollectionViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let color = presenter.color(for: indexPath.row) else { return }
    let detailsPresenter = ColorDetailsPresenter(with: color)
    let detailsController = ColorDetailsViewController(with: detailsPresenter)
    self.present(detailsController, animated: true, completion: nil)
  }
}
