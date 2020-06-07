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
  
  private lazy var myView: CardView = {
    let view = CardView()
    view.backgroundColor = .green
    view.labelText = "Tap Button"
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var myButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .yellow
    button.setTitle("My Gallery", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.red, for: .highlighted)
    button.addTarget(self, action: #selector(didTapMyButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var myLabel: UILabel = {
    let myLabel = UILabel()
    myLabel.textColor = .blue
    myLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    myLabel.text = "Hello, world!"
    myLabel.translatesAutoresizingMaskIntoConstraints = false
    return myLabel
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
    [myView, myButton, myLabel].forEach {
      view.addSubview($0)
    }
  }
  
  private func configureConstraints() {
    
    NSLayoutConstraint.activate([
      myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
      myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
      myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
      myView.heightAnchor.constraint(equalToConstant: 100),
      
      myButton.widthAnchor.constraint(equalToConstant: 100),
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

