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
  
  private lazy var myLabel: UILabel = {
    let myLabel = UILabel()
    myLabel.textColor = .blue
    myLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    myLabel.text = "Hello, world!"
    myLabel.translatesAutoresizingMaskIntoConstraints = false
    return myLabel
  }()
  
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    print("test")
    
    configureSubviews()
    configureConstraints()
  }
  
  // MARK: - Setup
  
  private func configureSubviews() {
    [].forEach {
      view.addSubview($0)
    }
  }
  
  private func configureConstraints() {
    
    NSLayoutConstraint.activate([
      
      ])
    
  }
  
  // MARK: - Actions
  

}
