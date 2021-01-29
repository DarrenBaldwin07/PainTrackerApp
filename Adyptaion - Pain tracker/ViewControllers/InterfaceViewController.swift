//
//  InterfaceViewController.swift
//  Adyptaion - Pain tracker
//
//  Created by Darren Baldwin Jr on 7/31/20.
//  Copyright © 2020 Darren Baldwin Jr. All rights reserved.
//

import UIKit
import Firebase



class InterfaceViewController: UIViewController, UITextFieldDelegate {
    
    
    
    var BlurAnimation = true
    var SavePainData = true
    var update: (() -> Void)?
    var PainNumbers = [Int]()
    var PainCount = [Int]()
    private var kAssociationKeyMaxLength: Int = 0

    
    
    

    let Defaults = UserDefaults.standard
    let date = Date()
    let calendar = Calendar.current
    
    
    
    
    
    
   
    
    
    
    
    
    
    struct DKeys {
        static let Userpain = "userpain"
        static let UserPainOnly = "ONLYPAIN"
        static let UserCauseOnly = "ONLYCAUSE"
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // makes blur effect not visible
        self.BlurEffect.alpha = 0
        
        let UserStatus = Defaults.value(forKey: "UserStatus") as? String ?? ""
        
        if UserStatus.isEmpty {
            DisplayPopUp()
            self.BlurEffect.alpha = 1
        }
        
        // function calling
        StylePainView()
        StylePainTrackerTextField()
        StyleHeartLabel()
        StyleSubmitbutton()
        StylePainStoreBtn()
        DisplayPainOnLabel()
        StyleCausebuttons()
        StyleCauseView()
        StyleCurrentPainView()
        StylePainCountView()
        DisplayProgressOfPain()
        StylePainLevel()
        DisplayCuaseOnLabel()
        StyleAverageView()
        StyleCustomCauseTextField()
        StyleCustomCauseView()
        StyleSaveOtherBtn()
        StyleWelcomeBackNotification()
        AddWelcomeBackView()

        // textfield delegate
        PainTrackerTextField.delegate = self
        
        // styles causetextfield
        PainLevel.transform = PainLevel.transform.scaledBy(x: 1, y: 2)
        
        CustomCauseTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        
        // Displays the pain average on label
        let PainAverageData = PainAverage!.average()
        AverageButton.text! = "\(PainAverageData)"
    }
    
    
   
    // outlets
    @IBOutlet var PopUpView: UIView!
    
    
    @IBOutlet weak var CheckMarkImage: UIImageView!
    
    
    @IBOutlet weak var ContinueButton: UIButton!

    
    @IBOutlet var UiInterface: UIView!
    
    
    @IBOutlet weak var PainTrackerView: UIView!
    
    
    @IBOutlet weak var PainTrackerTextField: UITextField!
    
    
    @IBOutlet weak var HeartLabel: UILabel!
    
    
    @IBOutlet weak var SubmitBtn: UIButton!
    
    
    @IBOutlet weak var BlurEffect: UIVisualEffectView!
    
    
    @IBOutlet var CheckMarkView: UIView!
    
    
    @IBOutlet weak var PainStore: UIButton!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    
    @IBOutlet weak var PainDisplay: UILabel!
    
    
    @IBOutlet var CauseView: UIView!
    
    
    @IBOutlet weak var FoodButton: UIButton!
    
    
    @IBOutlet weak var InjuryButton: UIButton!
    
    
    @IBOutlet weak var StressButton: UIButton!
    
    
    @IBOutlet weak var SicknessButton: UIButton!
    
    
    
    @IBOutlet weak var CurrentPainView: UIView!
    
    
    
    @IBOutlet weak var PainCountView: UIView!
    
    
    
    @IBOutlet weak var PainLevel: UIProgressView!
    
    
    @IBOutlet weak var CauseDisplayLabel: UILabel!
    
    
    @IBOutlet weak var OtherButton: UIButton!
    
    
    
    @IBOutlet weak var AverageButton: UILabel!
    
    
    @IBOutlet weak var AverageView: UIView!
    
    @IBOutlet weak var CustomCauseTextField: UITextField!
    
    
    @IBOutlet var CustomCauseView: UIView!
    
    
    
    @IBOutlet weak var SaveOtherBtn: UIButton!
    
    
    @IBOutlet var WelcomBackView: UIView!
    
    
    @IBOutlet weak var LogoImage: UIButton!
    
    
    
    
    // adds cause to user files
    @IBAction func FoodAction(_ sender: UIButton) {
        
        let CurrentDay = Date()
        let Format = DateFormatter()
        Format.dateStyle = .long
        let DateString = Format.string(from: CurrentDay)
        
        if (PainTrackerTextField.text != nil) && PainTrackerTextField.text != "" {
            PainList?.append(DateString + " " + PainTrackerTextField.text! + "/10" + " " + "Cause: Food")
        }
        
        Defaults.set(PainTrackerTextField.text! + "/10", forKey: DKeys.UserPainOnly)
        Defaults.set("Food", forKey: DKeys.UserCauseOnly)
        
        
        DisplayPainOnLabel()
        StyleCheckMarkPopUp()
        DisplayCuaseOnLabel()
        self.CheckMarkView.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.CauseView.alpha = 0
            self.BlurEffect.alpha = 0
            self.CauseView.transform = CGAffineTransform.identity
        }
        
        self.PainTrackerTextField.text = nil
        
    }
    
    
    // adds cause to user files
    @IBAction func InjuryAction(_ sender: UIButton) {
        
        let CurrentDay = Date()
        let Format = DateFormatter()
        Format.dateStyle = .long
        let DateString = Format.string(from: CurrentDay)
        
        if (PainTrackerTextField.text != nil) && PainTrackerTextField.text != "" {
            PainList?.append(DateString + " " + PainTrackerTextField.text! + "/10" + " " + "Cause: Injury")
        }
        
        Defaults.set(PainTrackerTextField.text! + "/10", forKey: DKeys.UserPainOnly)
        Defaults.set("Injury", forKey: DKeys.UserCauseOnly)
        
        
        DisplayPainOnLabel()
        StyleCheckMarkPopUp()
        DisplayCuaseOnLabel()
        self.CheckMarkView.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.CauseView.alpha = 0
            self.BlurEffect.alpha = 0
            self.CauseView.transform = CGAffineTransform.identity
        }
        
        self.PainTrackerTextField.text = nil
    }
    
    
    // adds cause to user files
    @IBAction func StressAction(_ sender: UIButton) {
        
        let CurrentDay = Date()
        let Format = DateFormatter()
        Format.dateStyle = .long
        let DateString = Format.string(from: CurrentDay)
        
        if (PainTrackerTextField.text != nil) && PainTrackerTextField.text != "" {
            PainList?.append(DateString + " " + PainTrackerTextField.text! + "/10" + " " + "Cause: Stress")
        }
        
        Defaults.set(PainTrackerTextField.text! + "/10", forKey: DKeys.UserPainOnly)
        Defaults.set("Stress", forKey: DKeys.UserCauseOnly)
        
        
        DisplayPainOnLabel()
        StyleCheckMarkPopUp()
        DisplayCuaseOnLabel()
        self.CheckMarkView.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.CauseView.alpha = 0
            self.BlurEffect.alpha = 0
            self.CauseView.transform = CGAffineTransform.identity
        }
        
        self.PainTrackerTextField.text = nil
    }
    
    
    // adds cause to user files
    @IBAction func SicknessAction(_ sender: UIButton) {
        
        
        
        let CurrentDay = Date()
        let Format = DateFormatter()
        Format.dateStyle = .long
        let DateString = Format.string(from: CurrentDay)
        
        if (PainTrackerTextField.text != nil) && PainTrackerTextField.text != "" {
            PainList?.append(DateString + " " + PainTrackerTextField.text! + "/10" + " " + "Cause: Sickness")
        }
        
        Defaults.set(PainTrackerTextField.text! + "/10", forKey: DKeys.UserPainOnly)
        Defaults.set("Sickness", forKey: DKeys.UserCauseOnly)
        
        
        DisplayPainOnLabel()
        StyleCheckMarkPopUp()
        DisplayCuaseOnLabel()
        self.CheckMarkView.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.CauseView.alpha = 0
            self.BlurEffect.alpha = 0
            self.CauseView.transform = CGAffineTransform.identity
        }
        
        self.PainTrackerTextField.text = nil
    }
    
    
    
    
    @IBAction func OtherBtnTap(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            self.CauseView.alpha = 0
            self.CauseView.transform = CGAffineTransform.identity
        }
        
        AddCustomCauseView()
    }
    
    
    
    @IBAction func SaveOtherTap(_ sender: UIButton) {
        
        // Save the Cause and pain
        
        
        // Gets the current Date
        let CurrentDay = Date()
        let Format = DateFormatter()
        Format.dateStyle = .long
        let DateString = Format.string(from: CurrentDay)
        
        
        let CustomCauseText = CustomCauseTextField.text!
        
        
        
               
        if (PainTrackerTextField.text != nil) && PainTrackerTextField.text != "" {
            PainList?.append(DateString + " " + PainTrackerTextField.text! + "/10" + " " + "Cause:" + " " + CustomCauseText)
        }
        
        
        
              
        // Displays the newly saved data
        Defaults.set(CustomCauseText, forKey: DKeys.UserCauseOnly)
        DisplayPainOnLabel()
        StyleCheckMarkPopUp()
        DisplayCuaseOnLabel()
        self.CheckMarkView.alpha = 1
        CustomCauseTextField.text = ""
        
        
        
        // Animate the pop-up off screen and remove blur view
        UIView.animate(withDuration: 1) {
            self.CustomCauseView.layer.position = CGPoint(x: 200, y: -600)
            self.BlurEffect.alpha = 0
            
        }
        
        
        self.PainTrackerTextField.text = nil
        self.CustomCauseTextField.resignFirstResponder()
        
    
        
    }
    
    
    
    
    
    
    
    
    
    @IBAction func SubmitBtnTap(_ sender: UIButton) {
        
        // Saves the users pain
        Defaults.set(PainTrackerTextField.text! + "/10", forKey: DKeys.UserPainOnly)
        
        if PainTrackerTextField.text == "" {
            SavePainData = false
        }
        
        if PainTrackerTextField.text == "0" {
            SavePain()
            StyleCheckMarkPopUp()
            DisplayPainOnLabel()
            PainTrackerTextField.resignFirstResponder()
            //PainTrackerTextField.text = ""
            self.CheckMarkView.alpha = 1
            self.PainTrackerTextField.text = nil
            
        }
        
        // detects if pain is high and if it is the app should display a popup with questions
        if PainTrackerTextField.text == "1" || PainTrackerTextField.text == "2" || PainTrackerTextField.text == "3" || PainTrackerTextField.text == "4" || PainTrackerTextField.text == "5" || PainTrackerTextField.text == "6" || PainTrackerTextField.text == "7" || PainTrackerTextField.text == "8" || PainTrackerTextField.text == "9" {
            // trigger popup
            PainTrackerTextField.resignFirstResponder()
            AddCauseView()
        }
        
        // Displays the average on a label
        if PainTrackerTextField != nil {
            DisplayProgressOfPain()
            let PainAverageData = PainAverage!.average()
            AverageButton.text! = "\(PainAverageData)"
        }
        
        
    }
    
    
    
    
    
    func AddCauseView() {
        
        
        self.CauseView.transform = CGAffineTransform(scaleX: 1, y: 1)
        self.CauseView.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.view.addSubview(self.CauseView)
            self.CauseView.center = self.view.center
            self.CauseView.alpha = 1
            self.BlurEffect.alpha = 1
            self.CauseView.transform = CGAffineTransform.identity
        }
        
    }
    
    
    func AddCustomCauseView() {
        self.CustomCauseView.transform = CGAffineTransform(scaleX: 1, y: 1)
        self.CustomCauseView.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.view.addSubview(self.CustomCauseView)
            self.CustomCauseView.alpha = 1
            self.CustomCauseView.layer.position = self.PainTrackerView.layer.position
            self.BlurEffect.alpha = 1
            self.CustomCauseView.transform = CGAffineTransform.identity
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    // Saves the users daily pain
    func SavePain() {
        let CurrentDay = Date()
        
        
        let Format = DateFormatter()
        Format.dateStyle = .long
        
        let DateString = Format.string(from: CurrentDay)
        
        if (PainTrackerTextField.text != nil) && PainTrackerTextField.text != "" {
            PainList?.append(DateString + " " + PainTrackerTextField.text! + "/10")
        }

       
        Defaults.set(PainTrackerTextField.text! + "/10", forKey: DKeys.UserPainOnly)
        
    }
    
    
    func DisplayProgressOfPain() {
        
        let Painbar = PainTrackerTextField.text
        Defaults.set(Painbar, forKey: "PainBar")
        
        
        if Painbar == "0" {
            self.PainLevel.setProgress(0, animated: true)
            PainAverage?.append(0)
        }
        
        
        if Painbar == "1" {
            self.PainLevel.setProgress(0.1, animated: true)
            PainAverage?.append(1)
        }
        
        if Painbar == "2" {
           self.PainLevel.setProgress(0.2, animated: true)
            PainAverage?.append(2)
        }
        
        if Painbar == "3" {
            self.PainLevel.setProgress(0.3, animated: true)
            PainAverage?.append(3)
        }
        
        if Painbar == "4" {
            self.PainLevel.setProgress(0.4, animated: true)
            PainAverage?.append(4)
        }
        
        if Painbar == "5" {
            self.PainLevel.setProgress(0.5, animated: true)
            PainAverage?.append(5)
        }
        
        if Painbar == "6" {
            self.PainLevel.setProgress(0.6, animated: true)
            PainAverage?.append(6)
        }
        
        if Painbar == "7" {
            self.PainLevel.setProgress(0.7, animated: true)
            PainAverage?.append(7)
        }
        
        if Painbar == "8" {
            self.PainLevel.setProgress(0.85, animated: true)
            PainAverage?.append(8)
        }
        
        if Painbar == "9" {
            self.PainLevel.setProgress(1, animated: true)
            PainAverage?.append(9)
        }
        
      
        
        
    }
    
    
    
    func DisplayCuaseOnLabel() {
        
        let cause = Defaults.value(forKey: DKeys.UserCauseOnly) as? String ?? ""
        self.CauseDisplayLabel.text = cause
        
        if cause.isEmpty {
            self.CauseDisplayLabel.text = "---"
            
        } else {
            self.CauseDisplayLabel.text = cause
        }
    }
    
    
    
    
    
    
    
    
    

    
    
     
    // Allows the keyboard to go away after pressing the enter key
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        CustomCauseTextField.resignFirstResponder()
       
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == PainTrackerTextField {
            PainTrackerTextField.resignFirstResponder()
            CustomCauseTextField.resignFirstResponder()
            
        }
        
        return true
    }
    
    
    // Closes pop-up view
    @IBAction func ContinueButtonTapped(_ sender: UIButton) {
        
        // animates View off screen
        UIView.animate(withDuration: 1) {
            
            self.PopUpView.layer.position = CGPoint(x: 200, y: 600)
            self.PopUpView.alpha = 0
            self.BlurEffect.alpha = 0
            self.BlurAnimation = false
        }
        
        
        
        // Saves value to tell if user is returning or new
        let UserStatus = Defaults.set("True", forKey: "UserStatus")
        
    }
    
    // styles the Pain tracker view
    func StylePainView() {
        self.PainTrackerView.layer.cornerRadius = 25
        self.PainTrackerView.layer.shadowColor = UIColor.red.cgColor
        self.PainTrackerView.layer.shadowRadius = 1
        self.PainTrackerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.PainTrackerView.layer.shadowOpacity = 285
        
    }
    
    
    // Styles the text field
    func StylePainTrackerTextField() {
        self.PainTrackerTextField.layer.masksToBounds = true
        self.PainTrackerTextField.layer.cornerRadius = 15
        self.PainTrackerTextField.layer.borderWidth = 1
        self.PainTrackerTextField.layer.borderColor = UIColor.white.cgColor
        
    }
    
    
    // styles the label
    func StyleHeartLabel() {
        self.HeartLabel.layer.masksToBounds = true
        self.HeartLabel.layer.cornerRadius = 10
        self.HeartLabel.layer.shadowColor = UIColor.lightGray.cgColor
        self.HeartLabel.layer.shadowRadius = 1
        self.HeartLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.HeartLabel.layer.shadowOpacity = 285
        
    }
    
    
    // Styles the button
    func StyleSubmitbutton() {
        self.SubmitBtn.layer.masksToBounds = true
        self.SubmitBtn.layer.cornerRadius = 15
        self.SubmitBtn.layer.shadowColor = UIColor.white.cgColor
        self.SubmitBtn.layer.shadowRadius = 1
        self.SubmitBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.SubmitBtn.layer.shadowOpacity = 0.5
    }
    
    
  
    
    
    // Displays the pop-up
    func DisplayPopUp() {
        self.view.addSubview(PopUpView)
        self.PopUpView.center = self.view.center
        self.PopUpView.layer.cornerRadius = 25
        self.PopUpView.layer.shadowColor = UIColor.lightGray.cgColor
        self.PopUpView.layer.shadowRadius = 1
        self.PopUpView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.PopUpView.layer.shadowOpacity = 285
        
    }
    
    // styles CheckmarkPopup and adds it to the view
    func StyleCheckMarkPopUp() {
        self.CheckMarkView.layer.cornerRadius = 25
        self.CheckMarkView.center = self.view.center
        self.view.addSubview(CheckMarkView)
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.RemovePopup), userInfo: nil, repeats: false)
        
    }
    
    // removes the view and animates it
    @objc func RemovePopup() {
        if CheckMarkView != nil {
            UIView.animate(withDuration: 0.6, animations: { () -> Void in
                self.CheckMarkView.alpha = 0
                
            })

        }
    
    }

    
    // Style Pain Store button
    func StylePainStoreBtn() {
        self.PainStore.layer.cornerRadius = 20
        
    }
    

    
    func DisplayPainOnLabel() {
        let painOnly = Defaults.value(forKey: DKeys.UserPainOnly) as? String ?? ""
        
        
        if painOnly.isEmpty {
            PainDisplay.text = "---"
        } else {
            self.PainDisplay.text = painOnly
        }
            
    }
    
    

    func StyleCausebuttons() {
        self.FoodButton.layer.cornerRadius = 17.5
        self.FoodButton.clipsToBounds = true
        self.InjuryButton.layer.cornerRadius = 17.5
        self.InjuryButton.clipsToBounds = true
        self.SicknessButton.layer.cornerRadius = 17.5
        self.SicknessButton.clipsToBounds = true
        self.StressButton.layer.cornerRadius = 17.5
        self.StressButton.clipsToBounds = true
        self.OtherButton.layer.cornerRadius = 17.5
        self.OtherButton.clipsToBounds = true
    }
    
    func StyleCauseView() {
        self.CauseView.layer.shadowColor = UIColor.lightGray.cgColor
        self.CauseView.layer.cornerRadius = 25
        self.CauseView.layer.shadowRadius = 1
        self.CauseView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.CauseView.layer.shadowOpacity = 285
        
        
    }
    
    func StyleCurrentPainView() {
        self.CurrentPainView.layer.cornerRadius = 25
        
    }
    
    
    func StylePainCountView() {
        self.PainCountView.layer.cornerRadius = 25
        
    }
    
    func StylePainLevel() {
        self.PainLevel.layer.cornerRadius = 5
        self.PainLevel.layer.masksToBounds = true
    }
    
    
    // Styles the button
    func StyleAverageView() {
        self.AverageView.layer.shadowColor = UIColor.lightGray.cgColor
        self.AverageView.layer.shadowRadius = 10.0
        self.AverageView.layer.shadowOffset = .zero
        self.AverageView.layer.shadowOpacity = 0.6
        self.AverageView.layer.shadowPath = UIBezierPath(rect: AverageView.bounds).cgPath
        
    }
    
    func StyleCustomCauseTextField() {
        self.CustomCauseTextField.layer.masksToBounds = true
        self.CustomCauseTextField.layer.cornerRadius = 10
        
    }
    
    func StyleCustomCauseView() {
        self.CustomCauseView.layer.masksToBounds = true
        self.CustomCauseView.layer.cornerRadius = 25
    }
    
    func StyleSaveOtherBtn() {
        self.SaveOtherBtn.layer.cornerRadius = 17.5
    }
    
    func StyleWelcomeBackNotification() {
        self.WelcomBackView.layer.cornerRadius = 25
    }
    

    
    func AddWelcomeBackView() {
        
        
        
        // makes WelcomeBackView hidden when view loads
        self.WelcomBackView.alpha = 0
        self.WelcomBackView.layer.position = CGPoint(x: 200, y: -600)
            
        // screen width for popup animation (centers it)
        let ScreenWidth = self.view.frame.size.width
        let OldUser2 = Defaults.value(forKey: "WelcomeBackDisplay2") as? String ?? ""
        
        if OldUser2.isEmpty == false {
            // animates welcome back view onto screen
            UIView.animate(withDuration: 3, delay: 1) {
                self.view.addSubview(self.WelcomBackView)
                self.WelcomBackView.alpha = 1
                self.WelcomBackView.layer.position = CGPoint(x: ScreenWidth / 2, y: 90)
                
            }
        } else {
            self.WelcomBackView.alpha = 0
            self.WelcomBackView.layer.position = CGPoint(x: 200, y: -600)
        }
             
             
        Timer.scheduledTimer(timeInterval: 2.2, target: self, selector: #selector(self.RemoveWelcomeBackView), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func RemoveWelcomeBackView() {
        
        
        UIView.animate(withDuration: 1, delay: 3) {
            self.WelcomBackView.layer.position = CGPoint(x: 200, y: -600)
            
        }
        
    }
    
    
}


// calculates average (extension)
extension Sequence where Element: AdditiveArithmetic {
    /// Returns the total sum of all elements in the sequence
    func sum() -> Element { reduce(.zero, +) }
}
extension Collection where Element: BinaryInteger {
    /// Returns the average of all elements in the array
    func average() -> Element { isEmpty ? .zero : sum() / Element(count) }
    /// Returns the average of all elements in the array as Floating Point type
    func average<T: FloatingPoint>() -> T { isEmpty ? .zero : T(sum()) / T(count) }
}
extension Collection where Element: BinaryFloatingPoint {
    /// Returns the average of all elements in the array
    func average() -> Element { isEmpty ? .zero : Element(sum()) / Element(count) }
}

// extension which restricts character length in textfields
private var kAssociationKeyMaxLength: Int = 0

extension UITextField {
    
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        
        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        let substring = prospectiveText[..<indexEndOfText]
        text = String(substring)
        
        selectedTextRange = selection
    }
}












