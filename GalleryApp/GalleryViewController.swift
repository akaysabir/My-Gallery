//
//  GalleryViewController.swift
//  GalleryApp
//
//  Created by zhussupov on 6/5/20.
//  Copyright © 2020 Zhussupov. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
  
  static var reuseId: String {
    return String(describing: self)
  }
  
}

class GalleryViewController: UIViewController {

  // MARK: - Properties
  
  private lazy var myLabel: UILabel = {
    let myLabel = UILabel()
    myLabel.textColor = .blue
    myLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    myLabel.text = "My Gallery"
    myLabel.translatesAutoresizingMaskIntoConstraints = false
    return myLabel
  }()
  
  private lazy var myCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSize(width: 100, height: 100)
    flowLayout.minimumLineSpacing = 20
    flowLayout.minimumInteritemSpacing = 20
    
    let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    view.backgroundColor = .lightGray
    view.dataSource = self
    view.delegate = self
    view.register(MyCell.self, forCellWithReuseIdentifier: MyCell.reuseId)
    
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private var data = [
    UIImage(named: "1"),
    UIImage(named: "2"),
    UIImage(named: "3"),
    UIImage(named: "1"),
    UIImage(named: "2"),
    UIImage(named: "3"),
    UIImage(named: "2")
  ]
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    configureSubviews()
    configureConstraints()
  }
  
  // MARK: - Setup
  
  private func configureSubviews() {
    [myLabel, myCollectionView].forEach {
      view.addSubview($0)
    }
  }
  
  private func configureConstraints() {
    
    NSLayoutConstraint.activate([
      myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
      
      myCollectionView.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 8),
      myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
      myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
      myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
      ])
    
  }
  
  // MARK: - Actions
}

extension GalleryViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.reuseId, for: indexPath) as? MyCell
    cell?.image = data[indexPath.row]
    return cell ?? UICollectionViewCell()
  }
  
  
}

extension GalleryViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let fullImageVC = FullImageViewController()
    
    fullImageVC.image = data[indexPath.row]
    
    navigationController?.pushViewController(fullImageVC, animated: true)
    
  }
}
