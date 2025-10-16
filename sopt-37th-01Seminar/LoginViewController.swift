//
//  LoginViewController.swift
//  sopt-37th-01Seminar
//
//  Created by JIN on 9/16/25.
//

import UIKit

class LoginViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - UI Components
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 165, width: self.view.bounds.width - 40, height: 50))
        label.text = "동네라서 가능한 모든 것 \n당근에서 가까운 이웃과 함께해요"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 250, width: self.view.bounds.width - 40, height: 45))
        textField.placeholder = "아이디"
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.leftView = UIView(frame: CGRect(x: 5, y: 5, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 23, y: 4, width: 10, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 300, width: self.view.bounds.width - 40, height: 45))
        textField.placeholder = "비밀번호"
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 400, width: self.view.bounds.width - 40, height: 50))
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.addTarget(self, action: #selector(handleLoginButtonTapped) , for: .touchUpInside)
        return button
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 20, y: 500, width: self.view.bounds.width - 40, height: 50))
        searchBar.placeholder = "원하는 물건을 찾아보세요"
        searchBar.searchBarStyle = .prominent
        searchBar.delegate = self
        return searchBar
    }()
    
    @objc
    private func handleLoginButtonTapped() {
        presentToWelcomeVC()
//        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.setLabel(name: emailTextField.text ?? "")
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        let components = [
            titleLabel,
            emailTextField,
            passwordTextField,
            loginButton,
            searchBar
        ]
        
        components.forEach { view.addSubview($0) }
    }
    
    private func setLayout() {

    }
}

#Preview {
    LoginViewController()
}
