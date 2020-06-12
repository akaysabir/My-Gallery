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

class GalleryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  // MARK: - Properties
  
  private lazy var myLabel: UILabel = {
    let myLabel = UILabel()
    myLabel.textColor = .white
    myLabel.font = UIFont(name: "Copperplate", size: 24)
    myLabel.text = "My Gallery"
    myLabel.translatesAutoresizingMaskIntoConstraints = false
    return myLabel
  }()
  
  private lazy var addButton: UIButton = { //add photo button
    let button = UIButton()
    button.backgroundColor = .black
    button.setTitle("add", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(didTapMyButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 4
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.white.cgColor
    return button
  }()
  
  private lazy var myCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSize(width: 100, height: 100)
    flowLayout.minimumLineSpacing = 20
    flowLayout.minimumInteritemSpacing = 20
    
    let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
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
    UIImage(named: "4"),
    UIImage(named: "5"),
    UIImage(named: "6"),
    UIImage(named: "7"),
    UIImage(named: "8"),
    UIImage(named: "9"),
    UIImage(named: "10"),
    UIImage(named: "11"),
    UIImage(named: "12"),
    UIImage(named: "13"),
    UIImage(named: "14")
  ]
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .black
    
    configureSubviews()
    configureConstraints()
  }
  
  // MARK: - Setup
  
  private func configureSubviews() {
    [myLabel, addButton, myCollectionView].forEach {
      view.addSubview($0)
    }
  }
  
  private func configureConstraints() {
    
    NSLayoutConstraint.activate([
      myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      
      
      addButton.leadingAnchor.constraint(equalTo: myLabel.trailingAnchor, constant: 48),
      addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      addButton.widthAnchor.constraint(equalToConstant: 48),
      addButton.heightAnchor.constraint(equalToConstant: 28),
      
      
      myCollectionView.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 16),
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
  
  // -> adding new image
  
  @objc private func didTapMyButton() {
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    
    let actionSheet = UIAlertController(title: "Source", message: "Choose a source", preferredStyle: .actionSheet)
    
    actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
      if UIImagePickerController.isSourceTypeAvailable(.camera) {
        imagePickerController.sourceType = .camera
        self.present(imagePickerController, animated: true, completion: nil)
      } else {
        print("camera not available")
      }
    }))
    
    actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (UIAlertAction) in
      imagePickerController.sourceType = .photoLibrary
      self.present(imagePickerController, animated: true, completion: nil)
    }))
    
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil ))
    
    self.present(actionSheet, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[.originalImage] as! UIImage
    
    data.append(image)
    myCollectionView.reloadData()
    
    picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  // <-- end of adding new image
  
}

extension GalleryViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let fullImageVC = FullImageViewController()
    
    fullImageVC.image = data[indexPath.row]
    
    navigationController?.pushViewController(fullImageVC, animated: true)
    
  }
}
