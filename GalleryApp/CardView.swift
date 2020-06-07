//
//  CardView.swift
//  GalleryApp
//
//  Created by zhussupov on 6/6/20.
//  Copyright © 2020 Zhussupov. All rights reserved.
//

import UIKit

class CardView: UIView {
  
  // MARK: - Properties
  
  var labelText: String? {
    didSet {
      myLabel.text = labelText
    }
  }
  
  private lazy var myLabel: UILabel = {
    let myLabel = UILabel()
    myLabel.textColor = .blue
    myLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    myLabel.text = "Tap Button"
    myLabel.translatesAutoresizingMaskIntoConstraints = false
    return myLabel
  }()
  
  private lazy var myButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .yellow
    button.setTitle("kek", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.red, for: .highlighted)
    button.addTarget(self, action: #selector(didTapMyButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
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
    [myLabel, myButton].forEach {
      addSubview($0)
    }
  }
  
  private func configureConstraints() {
    
    NSLayoutConstraint.activate([
      myLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      myLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      
      myButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      myButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 8),
      myButton.widthAnchor.constraint(equalToConstant: 50),
      myButton.heightAnchor.constraint(equalToConstant: 24)
     
      ])
    
  }
  
  // MARK: - Actions
  
  @objc private func didTapMyButton() {
    
    print("cheburek")
    
  }
  
}
