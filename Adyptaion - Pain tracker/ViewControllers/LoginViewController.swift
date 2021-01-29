//
//  LoginViewController.swift
//  Adyptaion - Pain tracker
//
//  Created by Darren Baldwin Jr on 7/29/20.
//  Copyright © 2020 Darren Baldwin Jr. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var EmailTextfield: UITextField!
    
    
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    
    @IBOutlet weak var LoginButton: UIButton!
    
    
    @IBOutlet weak var SignUpSegueButton: UIButton!
    
    
    @IBOutlet weak var Errorlabel: UILabel!
    
    
    @IBOutlet weak var LoginViewBg: UIView!
    
    
    

    
    @IBOutlet weak var BottomLoginConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HideLabels()
        StyleLoginViewBG()
        EmailTextfield.delegate = self
        PasswordTextfield.delegate = self
        StyleLoginButton()
        StylePasswordTextField()
        StyleEmailTextfield()
        
    }
    
    
    
    
    
    
    
    
    func StyleLoginButton() {
        self.LoginButton.clipsToBounds = true
        self.LoginButton.layer.cornerRadius = 34.5
    }
    
    
    func StyleLoginViewBG() {
        self.LoginViewBg.layer.cornerRadius = 25
    }
    
    func StyleEmailTextfield() {
        self.EmailTextfield.clipsToBounds = true
        self.EmailTextfield.layer.cornerRadius = 18

    }
    
    
    func StylePasswordTextField() {
        self.PasswordTextfield.clipsToBounds = true
        self.PasswordTextfield.layer.cornerRadius = 18
    
    }
    
    
    
    
    
    // Allows the keyboard to go away after pressing the enter key
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        UIView.animate(withDuration: 1) {
            self.BottomLoginConstraint.constant = 37
            self.view.layoutIfNeeded()
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == EmailTextfield {
            PasswordTextfield.becomeFirstResponder()
        } else if textField == PasswordTextfield {
            PasswordTextfield.resignFirstResponder()
            UIView.animate(withDuration: 1) {
                self.BottomLoginConstraint.constant = 37
                self.view.layoutIfNeeded()
            }
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) {
            self.BottomLoginConstraint.constant = 275
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    
    // transitions user to interface
    func TransitionToInterface() {
        
        
        let homeViewController =
            storyboard?.instantiateViewController(identifier:
            Constants.StoryBoard.homeViewController) as?
            InterfaceViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
                       
    }
    
    
    
    
    // Hides the Error label
    func HideLabels() {
        Errorlabel.alpha = 0
        
    }
    
    // Un-hides the error message (label)
    func RevealErrors(_ message: String) {
        
        Errorlabel.text = message
        Errorlabel.alpha = 1
        
    }
    
    
    
    

    
    // Ratify the fields - (make sure the fields are filled in correctly)
    func RatifyFields() -> String? {
        
        // checks if the text fields are all filled in or not
        if EmailTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "All fields must be filled in."
            
        }
        
        // Check if password is secure/valid
        let securePassword = PasswordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if PasswordChecker.isPasswordValid(securePassword) == false {
            // Password is not secure
            return "Password requirments not met."
        }
        
        // check if email is valid
        let ValidEmail = EmailTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if PasswordChecker.isValid(ValidEmail) == false {
            // Email is not valid
            return "Please enter a valid email."
        }
        
        
        return nil
        
            
        
    }
    

    
 
    @IBAction func LoginButtonTap(_ sender: Any) {
        
        // Ratify fields
        let error = RatifyFields()
        
        // there is an error within the fields, therefore show error message
        if error != nil {
            
            RevealErrors(error!)
            
        }
        else {
            
            // cleaned versions
            let EmailField = EmailTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let PasswordField = PasswordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // sign in the user
            Auth.auth().signIn(withEmail: EmailField, password: PasswordField)  {
                (result, err) in
                
                
                if err != nil {
                    
                    // there was an error whilst creating the user (// err!.localizedDescription)
                    self.Errorlabel.text = "There Was an error"
                    self.Errorlabel.alpha = 1
                }
                else {
                    
                    self.TransitionToInterface()
                    Defaults.set("Olduser", forKey: "WelcomeBackDisplay2")
                }
                
                
                
                
            }
        }
        
        
    }
    
    
}
