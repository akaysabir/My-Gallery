//
//  MyCell.swift
//  GalleryApp
//
//  Created by zhussupov on 6/6/20.
//  Copyright © 2020 Zhussupov. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  var image: UIImage? {
    didSet {
      myImageView.image = image
    }
  }
  private lazy var myImageView: UIImageView = {
    let view = UIImageView()
    view.contentMode = UIView.ContentMode.scaleAspectFit
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureSubviews()
    configureConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Setup
  
  private func configureSubviews() {
    [myImageView].forEach {
      addSubview($0)
    }
  }
  
  private func configureConstraints() {
    
    NSLayoutConstraint.activate([
     myImageView.topAnchor.constraint(equalTo: topAnchor),
     myImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
     myImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
     myImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
    
  }
  
  // MARK: - Actions

}
