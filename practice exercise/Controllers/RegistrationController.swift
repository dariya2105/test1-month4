//
//  ViewController.swift
//  practice exercise
//
//  Created by User on 31/10/23.
//

import UIKit

class RegistrationController: UIViewController {

    private let createNewPasswordLbl = MakerView.shared.makeLabel(text: "Create New Password 🔐",
                                                             size: 30,
                                                             weight: .semibold
    )
    
    private let enterYourNewPasswordLbl = MakerView.shared.makeLabel(text: "Enter your new password. If you forget it, then you have to do forgot password.",
                                                             size: 18,
                                                             weight: .thin,
                                                             numberOfLines: 2,
                                                             lineSpacing: 3)
    
    private let passwordLbl = MakerView.shared.makeLabel(text: "Password",
                                                    size: 16,
                                                    weight: .bold)
    
    private let passwordTF = MakerView.shared.makeTF()
    
    private let redView = MakerView.shared.makeView()
    
    private let eyeBtn = MakerView.shared.makeButton(tintColor: .red,
                                                     imageName: "eye")
    
    private let confirmPasswordLbl = MakerView.shared.makeLabel(text: "Confirm Password",
                                                           size: 16,
                                                           weight: .bold)
    
    private let confirmPasswordTF = MakerView.shared.makeTF()
    
    private let eyeBtn2 = MakerView.shared.makeButton(tintColor: .red,
                                                 imageName: "eye")
    
    private let redView2 = MakerView.shared.makeView()
    
    var isPasswordVisible = false
    
    private let checkMarkBtn = MakerView.shared.makeButton(cornerRadius: 5,
                                                           tintColor: .clear,
                                                           imageName: "Group",
                                                           borderWidth: 2,
                                                           borderColor: UIColor.red.cgColor,
                                                           systemImageName: "checkmark.square.fill"
    )
    private let rememberMeLbl = MakerView.shared.makeLabel(text: "Remember Me",
                                                           size: 18,
                                                           weight: .medium)
    
    private let errorLbl = MakerView.shared.makeLabel(size: 16,
                                                      weight: .thin,
                                                      textColor: .red)
    
    private let continueBtn = MakerView.shared.makeButton(setTitle: "Continue",
                                                          backgroundColor: .systemGray3,
                                                          cornerRadius: 30,
                                                          fontSize: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }

    private func initUI() {
        view.addSubview(createNewPasswordLbl)
        setupConstraintsForCreateNewPasswordLbl()
        
        view.addSubview(enterYourNewPasswordLbl)
        setupConstraintsForEnterYourNewPasswordLbl()
        
        view.addSubview(passwordLbl)
        setupConstraintsForPasswordLbl()
        
        view.addSubview(passwordTF)
        setupConstraintsForPasswordTF()
        
        view.addSubview(redView)
        setupConstraintsForRedView()
        
        view.addSubview(eyeBtn)
        setupConstraintsForEyeBtn()
        
        view.addSubview(confirmPasswordLbl)
        setupConstraintForConfirmPasswordLbl()
        
        view.addSubview(confirmPasswordTF)
        setupConstraintForConfirmPasswordTF()
        
        view.addSubview(eyeBtn2)
        setupConstraintsForEyeBtn2()
        
        view.addSubview(redView2)
        setupConstraintsForRedView2()
        
        view.addSubview(checkMarkBtn)
        setupConstraintsForCheckMarkBtn()
        
        view.addSubview(rememberMeLbl)
        setupConstraintsForRememberMeLbl()
        
        view.addSubview(errorLbl)
        setupConstraintsForErrorLbl()
        
        view.addSubview(continueBtn)
        setupConstraintsForContinueBtn()
    }

    private func setupConstraintsForCreateNewPasswordLbl() {
        NSLayoutConstraint.activate([
        createNewPasswordLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 104),
        createNewPasswordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
        createNewPasswordLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func setupConstraintsForEnterYourNewPasswordLbl() {
        NSLayoutConstraint.activate([
            enterYourNewPasswordLbl.topAnchor.constraint(equalTo: createNewPasswordLbl.bottomAnchor, constant: 12),
            enterYourNewPasswordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            enterYourNewPasswordLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            enterYourNewPasswordLbl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupConstraintsForPasswordLbl() {
        NSLayoutConstraint.activate([
        passwordLbl.topAnchor.constraint(equalTo: enterYourNewPasswordLbl.bottomAnchor, constant: 32),
        passwordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }
    
    private func setupConstraintsForPasswordTF() {
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: passwordLbl.bottomAnchor, constant: 16),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTF.heightAnchor.constraint(equalToConstant: 32),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64)
        ])
    }
    
    private func setupConstraintsForRedView() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 8),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            redView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupConstraintsForEyeBtn() {
        NSLayoutConstraint.activate([
            eyeBtn.topAnchor.constraint(equalTo: passwordLbl.bottomAnchor, constant: 18),
            eyeBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            eyeBtn.heightAnchor.constraint(equalToConstant: 28),
            eyeBtn.widthAnchor.constraint(equalToConstant: 28)
        ])
        
        eyeBtn.addTarget(self, action: #selector(eyeBtnTapped), for: .touchUpInside)
    }
    
    @objc func eyeBtnTapped(_ sender: UIButton) {
        isPasswordVisible.toggle()
                passwordTF.isSecureTextEntry = !isPasswordVisible
    }
    
    private func setupConstraintForConfirmPasswordLbl() {
        NSLayoutConstraint.activate([
            confirmPasswordLbl.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 24),
            confirmPasswordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }
    
    private func setupConstraintForConfirmPasswordTF() {
        NSLayoutConstraint.activate([
            confirmPasswordTF.topAnchor.constraint(equalTo: confirmPasswordLbl.bottomAnchor, constant: 16),
            confirmPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            confirmPasswordTF.heightAnchor.constraint(equalToConstant: 32),
            confirmPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64)
        ])
    }
    
    private func setupConstraintsForEyeBtn2() {
        NSLayoutConstraint.activate([
        eyeBtn2.topAnchor.constraint(equalTo: confirmPasswordLbl.bottomAnchor, constant: 18),
        eyeBtn2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        eyeBtn2.heightAnchor.constraint(equalToConstant: 28),
        eyeBtn2.widthAnchor.constraint(equalToConstant: 28)
        ])
        
        eyeBtn2.addTarget(self, action: #selector(eyeBtn2Tapped), for: .touchUpInside)
    }
    @objc func eyeBtn2Tapped(_ sender: UIButton) {
        isPasswordVisible.toggle()
        confirmPasswordTF.isSecureTextEntry = !isPasswordVisible
    }
    
    private func setupConstraintsForRedView2() {
        NSLayoutConstraint.activate([
            redView2.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 8),
            redView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            redView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            redView2.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupConstraintsForCheckMarkBtn() {
        NSLayoutConstraint.activate([
            checkMarkBtn.topAnchor.constraint(equalTo: redView2.bottomAnchor, constant: 24),
            checkMarkBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            checkMarkBtn.heightAnchor.constraint(equalToConstant: 24),
            checkMarkBtn.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        checkMarkBtn.addTarget(self, action: #selector(checkMarkTapped), for: .touchUpInside)
    }
    
    @objc func checkMarkTapped() {
        checkMarkBtn.isSelected.toggle()
        checkMarkBtn.tintColor = .red
    }
    
    private func setupConstraintsForRememberMeLbl() {
        NSLayoutConstraint.activate([
            rememberMeLbl.topAnchor.constraint(equalTo: redView2.bottomAnchor, constant: 24),
            rememberMeLbl.leadingAnchor.constraint(equalTo: checkMarkBtn.trailingAnchor, constant: 16)
        ])
    }
    
    private func setupConstraintsForErrorLbl() {
        NSLayoutConstraint.activate([
            errorLbl.topAnchor.constraint(equalTo: checkMarkBtn.bottomAnchor, constant: 16),
            errorLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }
    
    private func setupConstraintsForContinueBtn() {
        NSLayoutConstraint.activate([
            continueBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
            continueBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            continueBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            continueBtn.heightAnchor.constraint(equalToConstant: 58)
        ])
        
        continueBtn.addTarget(self, action: #selector(continueBtnTapped), for: .touchUpInside)
        
    }
    

    @objc func continueBtnTapped(_ sender: UIButton) {
        var shouldNavigate = true
                if passwordTF.text?.isEmpty ?? true {
                    passwordTF.layer.borderColor = UIColor.red.cgColor
                    passwordTF.layer.borderWidth = 0.4
                    passwordTF.placeholder = "  Fill the field  "
                    shouldNavigate = false
                }
        if confirmPasswordTF.text?.isEmpty ?? true {
                    confirmPasswordTF.layer.borderColor = UIColor.red.cgColor
                    confirmPasswordTF.layer.borderWidth = 0.4
                    confirmPasswordTF.placeholder = "  Fill the field  "
                    shouldNavigate = false
                }
        if passwordTF.text != confirmPasswordTF.text {
                    passwordTF.layer.borderColor = UIColor.red.cgColor
                    passwordTF.layer.borderWidth = 0.4
                    confirmPasswordTF.layer.borderColor = UIColor.red.cgColor
                    confirmPasswordTF.layer.borderWidth = 0.4
                    errorLbl.text = "Passwords mismatch"
                    shouldNavigate = false
                }
        if shouldNavigate && (passwordTF.text!.count >= 8 && confirmPasswordTF.text!.count >= 8) {
            continueBtn.isEnabled = true
                        passwordTF.layer.borderColor = UIColor.white.cgColor
                        confirmPasswordTF.layer.borderColor = UIColor.white.cgColor
                        errorLbl.text = ""
                        continueBtn.backgroundColor = .red
                        let vc = NotificationController()
                        vc.title = "Notification"
                        navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

