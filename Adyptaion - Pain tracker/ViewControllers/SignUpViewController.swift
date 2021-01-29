//
//  SignUpViewController.swift
//  Adyptaion - Pain tracker
//
//  Created by Darren Baldwin Jr on 7/28/20.
//  Copyright © 2020 Darren Baldwin Jr. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var HasSignedUp = false


    
    // outlets (connections via from Ui elements)
    @IBOutlet weak var FirstTextField: UITextField!
    
    
    @IBOutlet weak var LastTextField: UITextField!
    
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    
    @IBOutlet weak var SignUpBottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HideLabels()
        FirstTextField.delegate = self
        LastTextField.delegate = self
        EmailTextField.delegate = self
        PasswordTextField.delegate = self
        StyleFirstNameTextField()
        StyleLastNameTextField()
        StyleEmailTextField()
        StylePasswordTextField()
       
    }
    
    
    func StyleFirstNameTextField() {
        self.FirstTextField.layer.cornerRadius = 20
        self.FirstTextField.layer.masksToBounds = true
    }
    
    func StyleLastNameTextField() {
        self.LastTextField.layer.cornerRadius = 20
        self.LastTextField.layer.masksToBounds = true
        
    }
    
    func StyleEmailTextField() {
        self.EmailTextField.layer.cornerRadius = 20
        self.EmailTextField.layer.masksToBounds = true
        
        
    }
    
    func StylePasswordTextField() {
        self.PasswordTextField.layer.cornerRadius = 20
        self.PasswordTextField.layer.masksToBounds = true
       
        
    }
    
   
    
    // Allows the keyboard to go away after pressing the enter key
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        UIView.animate(withDuration: 1) {
            self.SignUpBottomConstraint.constant = 10
            self.view.layoutIfNeeded()
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        if textField == FirstTextField {
            LastTextField.becomeFirstResponder()
        } else if textField == LastTextField {
        EmailTextField.becomeFirstResponder()
        } else if textField == EmailTextField {
            PasswordTextField.becomeFirstResponder()
        } else if textField == PasswordTextField {
            PasswordTextField.resignFirstResponder()
            UIView.animate(withDuration: 1) {
                self.SignUpBottomConstraint.constant = 10
                self.view.layoutIfNeeded()
            }
            
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) {
            self.SignUpBottomConstraint.constant = 270
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    // Hides the error label
    func HideLabels() {
        ErrorLabel.alpha = 0
        
    }
    
    // moves user to interface after successful creating an account
    func TransitionToInterface() {
        
        
        let homeViewController =
            storyboard?.instantiateViewController(identifier:
            Constants.StoryBoard.homeViewController) as?
            InterfaceViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
                       
    }
    
    // Un-hides the error message (label)
    func RevealErrors(_ message: String) {
        
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
        
    }
    
    
    
    // makes sure data entered in fields is correct. Otherwise it displays an error message
    func RatifyFields() -> String? {
        
        // Check if the text fields are full or empty
        if FirstTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || LastTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "All fields must be filled in."
        }
        
        // Check if password is secure/valid
        let securePassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if PasswordChecker.isPasswordValid(securePassword) == false {
            // Password is not secure
            return "Password requirments not met."
        }
        
        // check if email is valid
        let ValidEmail = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if PasswordChecker.isValid(ValidEmail) == false {
            // Email is not valid
            return "Please enter a valid email."
        }
        
        
        return nil
    }
    
    
    
    
    @IBAction func SignUpTap(_ sender: Any) {
        
        // Ratify fields
        let error = RatifyFields()
        
        // there is an error within the fields, therefore show error message
        if error != nil {
            
            RevealErrors(error!)
            
        }
        else {
            
            // create new data
            let firstname = FirstTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = LastTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let EmailField = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let PasswordField = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: EmailField, password: PasswordField) { (result, err) in
                
                if err != nil {
                    
                    
                    // there was an error whilst creating the user
                    self.RevealErrors("Error whilst creating user")
                }
                else {
                    // user was created successfully - store the first name and last name
                    let db = Firestore.firestore()
                    
                    
                    db.collection("users").addDocument(data: ["firstname":firstname, "lastname": lastname, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            
                            self.RevealErrors("Something went wrong during data saving process.")
                        
                        }
                    }
                    
                    // let user onto the interface
                    self.TransitionToInterface()
                    Defaults.set("Olduser", forKey: "WelcomeBackDisplay2")
                    
                
                    
               
                }
            
            
            
        }
        
        
        
        
    }
        
    
        

    
    
    
}

}


// extension - Creates border color editor in storyboard
extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
