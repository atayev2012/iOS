//
//  MainViewController.swift
//  UserProfile
//
//  Created by Batyr on 22.09.2024.
//

import UIKit

let buttonColor = UIColor(red: 27/255, green: 145/255, blue: 1.0, alpha: 1.0)
let bckgrndColor = UIColor(red: 235/255, green: 248/255, blue: 1.0, alpha: 1.0)
let headerColor = UIColor(red: 0, green: 20/255, blue: 74/255, alpha: 1.0)

class MainViewController: UIViewController{
    
    private var headerView: UIView = {
        let headView = UIView()
        headView.backgroundColor = headerColor
        headView.layer.shadowColor = UIColor.black.cgColor
        headView.layer.shadowOpacity = 1
        headView.layer.shadowOffset = .zero
        headView.layer.shadowRadius = 10
        
        headView.translatesAutoresizingMaskIntoConstraints = false
        return headView
        
    }()
    
    private var editButton: UIButton = {
        let button = UIButton()
        
        button.setTitle(" Edit Profile", for: .normal)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.tintColor = .white
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 20
        button.backgroundColor = buttonColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Batyr Atayev" // name from user data
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var ageLabel: UILabel = {
        let label  = UILabel()
        label.text = "30 years old" // age from user data
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.backgroundColor = bckgrndColor
        
        view.addSubview(headerView)
        view.addSubview(profileImageView)
        view.addSubview(editButton)
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            headerView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            profileImageView.centerYAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0.0),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            editButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2)
            
        ])
        
        
        
    }
}
