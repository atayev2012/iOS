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
let labelTagColor = UIColor(red: 131/255, green: 150/255, blue: 168/255, alpha: 1.0)

class MainViewController: UIViewController{
    
    private var headerView: UIView = {
        let headView = UIView()
        headView.backgroundColor = buttonColor// headerColor
//        headView.layer.shadowColor = UIColor.black.cgColor
//        headView.layer.shadowOpacity = 1
//        headView.layer.shadowOffset = .zero
//        headView.layer.shadowRadius = 10
        
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
        label.textColor = headerColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var ageLabel: UILabel = {
        let label  = UILabel()
        label.text = "30 years old" // age from user data
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = labelTagColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private var dataContainerView: UIView = {
        let dataView = UIView()
        dataView.backgroundColor = .white
        dataView.layer.cornerRadius = 20
        
        dataView.layer.shadowColor = UIColor.black.cgColor
        dataView.layer.shadowOpacity = 0.2
        dataView.layer.shadowOffset = .zero
        dataView.layer.shadowRadius = 3
        
        dataView.layer.opacity = 0.5
        
        dataView.translatesAutoresizingMaskIntoConstraints = false
        return dataView
    }()
    
    private var lineDividerView1: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = labelTagColor
        lineView.layer.opacity = 0.3
                
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    private var lineDividerView2: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = labelTagColor
        lineView.layer.opacity = 0.3

        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    private var sexLabelTag: UILabel = {
        let label  = UILabel()
        label.text = "Sex:"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = buttonColor // labelTagColor
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var cellLabelTag: UILabel = {
        let label  = UILabel()
        label.text = "Cell:"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = buttonColor // labelTagColor
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emailLabelTag: UILabel = {
        let label  = UILabel()
        label.text = "Email:"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = buttonColor // labelTagColor
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private var sexLabel: UILabel = {
        let label  = UILabel()
        label.text = "Male" // sex from user data
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = headerColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var cellLabel: UILabel = {
        let label  = UILabel()
        label.text = "+7 (999) 999 99 99" // cell from user data
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = headerColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emailLabel: UILabel = {
        let label  = UILabel()
        label.text = "atayev2012@gmail.com" // email from user data
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = headerColor
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
        view.addSubview(dataContainerView)
        
        view.addSubview(lineDividerView1)
        view.addSubview(lineDividerView2)
        
        view.addSubview(sexLabelTag)
        view.addSubview(cellLabelTag)
        view.addSubview(emailLabelTag)
        view.addSubview(sexLabel)
        view.addSubview(cellLabel)
        view.addSubview(emailLabel)
        
        
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
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            
            dataContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dataContainerView.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            dataContainerView.heightAnchor.constraint(equalToConstant: 140),
            dataContainerView.widthAnchor.constraint(equalToConstant: view.frame.width - 50),
            
            sexLabelTag.rightAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: -25),
            sexLabelTag.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 40),
            
            lineDividerView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineDividerView1.widthAnchor.constraint(equalTo: dataContainerView.widthAnchor, constant: -50),
            lineDividerView1.heightAnchor.constraint(equalToConstant: 1),
            lineDividerView1.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 10),
            
            
            cellLabelTag.rightAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: -25),
            cellLabelTag.topAnchor.constraint(equalTo: sexLabelTag.bottomAnchor, constant: 20),
            
            lineDividerView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineDividerView2.widthAnchor.constraint(equalTo: dataContainerView.widthAnchor, constant: -50),
            lineDividerView2.heightAnchor.constraint(equalToConstant: 1),
            lineDividerView2.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 10),
            
            emailLabelTag.rightAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: -25),
            emailLabelTag.topAnchor.constraint(equalTo: cellLabelTag.bottomAnchor, constant: 20),
            
            sexLabel.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: -10),
            sexLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant:40),
            
            cellLabel.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: -10),
            cellLabel.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 20),
            
            emailLabel.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: -10),
            emailLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 20)
            
        ])
        
        
        
    }
}
