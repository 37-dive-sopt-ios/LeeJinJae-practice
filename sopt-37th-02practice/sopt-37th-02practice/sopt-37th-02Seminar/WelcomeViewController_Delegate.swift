//
//  WelcomeViewController_Delegate.swift
//  sopt-37th-01Seminar
//
//  Created by JIN on 10/18/25.
//

import UIKit

//
//  WelcomeViewController.swift
//  sopt-37th-01Seminar
//
//  Created by JIN on 10/11/25.
//

import Foundation
import UIKit

final class WelcomeViewController_Delegate: UIViewController, UITextViewDelegate {
    
    weak var delegate: WelcomeReloginDelegate?
    
    var name: String?

    private func bindID() {
        guard let name = self.name else { return }
        self.welcomeLabel.text = "\(name.isEmpty ? "회원" : name)님 \n반가워요!"
    }
    
    func setLabel(name: String?) {
        self.name = name
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "rabit")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 36, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 36, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인하기", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector (backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    @objc
    private func backToLoginButtonDidTap() {
        
        delegate?.retrylogin(didTapReloginWith: "다시 로그인 버튼을 눌렀어요")
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        bindID()
        setLayout()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            
            self.view.addSubview($0)
        }
    }
}

