//
//  FullImageViewController.swift
//  GalleryApp
//
//  Created by zhussupov on 6/7/20.
//  Copyright © 2020 Zhussupov. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController {

  // MARK: - Properties
  
  private lazy var imageLabel: UILabel = {
    let myLabel = UILabel()
    myLabel.textColor = .gray
    myLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    myLabel.text = "Image Label?"
    myLabel.translatesAutoresizingMaskIntoConstraints = false
    return myLabel
  }()
  
  var image: UIImage? {
    didSet {
      fullImageView.image = image
    }
  }
  
  private lazy var fullImageView: UIImageView = {
    let view = UIImageView()
    view.contentMode = UIView.ContentMode.scaleAspectFit
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    configureSubviews()
    configureConstraints()
  }
  
  // MARK: - Setup
  
  private func configureSubviews() {
    [imageLabel, fullImageView].forEach {
      view.addSubview($0)
    }
  }
  
  private func configureConstraints() {
    
    NSLayoutConstraint.activate([
      imageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
      imageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageLabel.heightAnchor.constraint(equalToConstant: 24),
      
      fullImageView.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 8),
      fullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
      fullImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
      fullImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
      ])
    
  }
  
  // MARK: - Actions
  

}
