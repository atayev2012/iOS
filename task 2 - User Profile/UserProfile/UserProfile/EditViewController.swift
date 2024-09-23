//
//  EditViewController.swift
//  UserProfile
//
//  Created by Batyr on 22.09.2024.
//

import UIKit

protocol EditViewControllerDelegate {
    func getUserInfo() -> UserInfo
    func dateToStr(dateValue: Date) -> String
    func strToDate(dateValue: String) -> Date
    func calculateAge(dateOfBirth: Date) -> Int
    func saveUserInfo(
        firstName: String?,
        lastName: String?,
        dateOfBirth: String?,
        age: Int?,
        sex: String?,
        cell: String?,
        email: String?
    )
}

class EditViewController: UIViewController {
    
    var delegate: EditViewControllerDelegate?
    
    private lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.text = delegate?.getUserInfo().firstName
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.text = delegate?.getUserInfo().lastName
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var dateFieldView: UIDatePicker = {
        let dateField = UIDatePicker()
        dateField.date = (delegate?.strToDate(dateValue: (delegate?.getUserInfo().dateOfBirth)!)) ?? Date()
        dateField.datePickerMode = .date
        dateField.maximumDate = Date()
        dateField.contentHorizontalAlignment = .center
        dateField.translatesAutoresizingMaskIntoConstraints = false
        return dateField
    }()
    
    private lazy var sexTextField: UITextField = {
        let textField = UITextField()
        textField.text = delegate?.getUserInfo().sex
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var cellTextField: UITextField = {
        let textField = UITextField()
        textField.text = delegate?.getUserInfo().cell
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = delegate?.getUserInfo().email
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First Name:"
        label.textAlignment = .right
        label.textColor = labelTagColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Name:"
        label.textAlignment = .right
        label.textColor = labelTagColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of Birth:"
        label.textAlignment = .right
        label.textColor = labelTagColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var sexLabel: UILabel = {
        let label = UILabel()
        label.text = "Sex:"
        label.textAlignment = .right
        label.textColor = labelTagColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Cell:"
        label.textAlignment = .right
        label.textColor = labelTagColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.textAlignment = .right
        label.textColor = labelTagColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Save", for: .normal)
        button.tintColor = .white
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 20
        button.backgroundColor = buttonColor
        
        button.addAction(
                    .init{ [weak self] _ in
                        guard let self = self else { return }
                        if let delegate = delegate {
                            delegate.saveUserInfo(
                                firstName: firstNameTextField.text ?? " ",
                                lastName: lastNameTextField.text ?? " ",
                                dateOfBirth: delegate.dateToStr(dateValue: dateFieldView.date),
                                age: delegate.calculateAge(dateOfBirth: dateFieldView.date),
                                sex: sexTextField.text ?? " ",
                                cell: cellTextField.text ?? " ",
                                email: emailTextField.text ?? " "
                            )
                        }
                        navigationController?
                            .popViewController(animated: true)
                        print("Save button was pressed")
                    } , for: .touchUpInside)
        
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = bckgrndColor
        
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        
        view.addSubview(lastNameLabel)
        view.addSubview(lastNameTextField)
        
        view.addSubview(dateOfBirthLabel)
        view.addSubview(dateFieldView)
        
        view.addSubview(sexLabel)
        view.addSubview(sexTextField)
        
        view.addSubview(cellLabel)
        view.addSubview(cellTextField)
        
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            firstNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            firstNameLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: view.frame.width / -5),
            firstNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           
            
            firstNameTextField.leftAnchor.constraint(equalTo: firstNameLabel.rightAnchor, constant: 20),
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.topAnchor),
            firstNameTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7 - 40),
            
            lastNameLabel.rightAnchor.constraint(equalTo: firstNameLabel.rightAnchor),
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20),
            
            lastNameTextField.leftAnchor.constraint(equalTo: lastNameLabel.rightAnchor, constant: 20),
            lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.topAnchor),
            lastNameTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7 - 40),
            
            dateOfBirthLabel.rightAnchor.constraint(equalTo: lastNameLabel.rightAnchor),
            dateOfBirthLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 20),
            
            dateFieldView.leftAnchor.constraint(equalTo: dateOfBirthLabel.rightAnchor, constant: 20),
            dateFieldView.topAnchor.constraint(equalTo: dateOfBirthLabel.topAnchor),
            dateFieldView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7 - 40),
            
            sexLabel.rightAnchor.constraint(equalTo: dateOfBirthLabel.rightAnchor),
            sexLabel.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 20),
            
            sexTextField.leftAnchor.constraint(equalTo: sexLabel.rightAnchor, constant: 20),
            sexTextField.topAnchor.constraint(equalTo: sexLabel.topAnchor),
            sexTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7 - 40),
            
            cellLabel.rightAnchor.constraint(equalTo: sexLabel.rightAnchor),
            cellLabel.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 20),
            
            cellTextField.leftAnchor.constraint(equalTo: cellLabel.rightAnchor, constant: 20),
            cellTextField.topAnchor.constraint(equalTo: cellLabel.topAnchor),
            cellTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7 - 40),
            
            emailLabel.rightAnchor.constraint(equalTo: cellLabel.rightAnchor),
            emailLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 20),
            
            emailTextField.leftAnchor.constraint(equalTo: emailLabel.rightAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.topAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7 - 40),
            
            saveButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            
        ])
        
        
    }
    
}
