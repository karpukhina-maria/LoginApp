//
//  ViewController.swift
//  LoginApp
//
//  Created by Mary Jane on 23.08.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let userData = UserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard authorizationIsSuccess() else {
            showAlert(with: "Login or password is wrong!", and: "Error authorization")
            passwordTextField.text = ""
            return
        }
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.userName = usernameTextField.text
    }
    
    // MARK: - Work with keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            self.performSegue(withIdentifier: "welcomeVC", sender: self)
        }
       return true
    }
    
    // MARK: - IBActions
    @IBAction func forgotUsernameButtonPressed() {
        showAlert(with: "Your Username is \(userData.username)", and: "Username reminder")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Your password is \(userData.password)", and: "Password reminder")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else {
            return
        }
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Private methods
extension ViewController {
    private func authorizationIsSuccess() -> Bool {
        usernameTextField.text == userData.username && passwordTextField.text == userData.password
    }
    
    private func showAlert(with message: String, and title: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
