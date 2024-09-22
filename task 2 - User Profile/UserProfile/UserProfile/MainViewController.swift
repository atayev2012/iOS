//
//  MainViewController.swift
//  UserProfile
//
//  Created by Batyr on 22.09.2024.
//

import UIKit

class MainViewController: UIViewController{
    
    
    private var headerView: UIView = {
        let headView = UIView()
        headView.backgroundColor = .red
        headView.translatesAutoresizingMaskIntoConstraints = false
        return headView
        
    }()
    
    private var editPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.currentImage = (image: UIImage(systemItem: .trash), for: <#T##UIControl.State#>)
        
        return button
    }()
    
    private var profileImageView: UIImageView = {
        let userImageView  = UIImageView()
        userImageView.image = UIImage(named: "userIMG") // set image from variables loaded from csv file
        
        userImageView.layer.borderWidth = 2
        userImageView.layer.borderColor = UIColor.white.cgColor
        
        userImageView.layer.cornerRadius = 75.0
        userImageView.layer.masksToBounds = true
        
        userImageView.contentMode = .scaleAspectFit
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return userImageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        view.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            headerView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            profileImageView.centerYAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0.0),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        
        
    }
}
