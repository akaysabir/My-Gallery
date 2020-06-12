//
//  ViewController.swift
//  GalleryApp
//
//  Created by zhussupov on 6/5/20.
//  Copyright © 2020 Zhussupov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  // custom view example...
//  private lazy var myView: CardView = {
//    let view = CardView()
//    view.backgroundColor = UIColor.white
//    view.labelText = "Tap Button"
//    view.translatesAutoresizingMaskIntoConstraints = false
//    return view
//  }()
  
  private lazy var myButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .white
    button.setTitle("My Gallery", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(didTapMyButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 15
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.black.cgColor
    return button
  }()
  
  private lazy var myLabel: UILabel = {
    let myLabel = UILabel()
    myLabel.textColor = .black
    myLabel.font = UIFont(name: "Copperplate", size: 24)
    myLabel.text = "Welcome to"
    myLabel.translatesAutoresizingMaskIntoConstraints = false
    return myLabel
  }()
  
  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let gradientLayer = CAGradientLayer() //gradient ->
    gradientLayer.frame = self.view.bounds
    gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
    self.view.layer.insertSublayer(gradientLayer, at: 0) //<-

    self.navigationController?.navigationBar.barTintColor = .black
    
    configureSubviews()
    configureConstraints()
  }

  // MARK: - Setup
  
  private func configureSubviews() {
    [myButton, myLabel].forEach {
      view.addSubview($0)
    }
  }
  
  private func configureConstraints() {
    
    NSLayoutConstraint.activate([
//      myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//      myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
//      myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//      myView.heightAnchor.constraint(equalToConstant: 100),
      
      myButton.widthAnchor.constraint(equalToConstant: 124),
      myButton.heightAnchor.constraint(equalToConstant: 50),
      myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      myLabel.bottomAnchor.constraint(equalTo: myButton.topAnchor, constant: -24)
      
    ])
    
  }

  // MARK: - Actions
  
  @objc private func didTapMyButton() {
    
    let vc = GalleryViewController()
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
}

