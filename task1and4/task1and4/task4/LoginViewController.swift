//
//  LoginViewController.swift
//  task1and4
//
//  Created by Сергей Никулин on 06.05.2018.
//  Copyright © 2018 SNikulin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginTextField.delegate = self
    }
    
    // MARK: Actions
    
    @IBAction func validateTapped(_ sender: Any) {
        validationLabel.isHidden = false
        if Validator.validate(login: loginTextField.text ?? "") {
            validationLabel.text = "Login is valid"
            validationLabel.textColor = UIColor.green
        } else {
            validationLabel.text = "Login is not valid"
            validationLabel.textColor = UIColor.red
        }
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validationLabel.isHidden = textField.text?.count == 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
}
