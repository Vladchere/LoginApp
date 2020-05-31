//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Vladislav on 30.05.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let user = User.getUser()
    
    // MARK: - Lyfe Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let destinationVC = tabBarController.viewControllers?.first as? WelcomeViewController else { return }
        
        destinationVC.userName = userNameTextField.text
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        clearTextField()
    }
    
    // MARK: - IB Actions
    @IBAction func loginAction() {
        checkLogin()
    }
    
    @IBAction func forgotNameAction() {
        presentAlert(title: "Oooops!", message: "Your name is \(user.name) 😄")
    }
    
    @IBAction func forgotPasswordAction() {
        presentAlert(title: "Oooops!", message: "Your password is \(user.password) 😄")
    }
    
    // MARK: - Private methods
    private func checkLogin() {
        if (userNameTextField.text != user.name || passwordTextField.text != user.password) {
            let alert = UIAlertController(title: "Invalid login or password",
                                          message: "Please, enter correct login and password",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
                self.passwordTextField.text = nil
            }
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "showWelcome", sender: self)
        }
    }
    
    private func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func clearTextField() {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        self.view.frame.origin.y = 150 - keyboardSize.height
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            passwordTextField.becomeFirstResponder()
        case 1:
            loginAction()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
