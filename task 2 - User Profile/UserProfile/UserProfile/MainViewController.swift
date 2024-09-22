//
//  MainViewController.swift
//  UserProfile
//
//  Created by Batyr on 22.09.2024.
//

import UIKit

class MainViewController: UIViewController{
    
    
    private var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            headerView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            headerView.heightAnchor.constraint(equalToConstant: view.status)
        ])
        
    }
}
