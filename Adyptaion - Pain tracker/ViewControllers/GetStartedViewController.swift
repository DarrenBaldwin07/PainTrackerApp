//
//  GetStartedViewController.swift
//  Adyptaion - Pain tracker
//
//  Created by Darren Baldwin Jr on 7/27/20.
//  Copyright © 2020 Darren Baldwin Jr. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    let Defaults = UserDefaults.standard
    

    var OldUserBool = false
    
    
    struct keys {
        static let Olduser = "olduser"
        
        static let WelcomeSave = "HasbeenTapped"
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // function calling
        StyleSplashView()
        DisplayWelcomeback()
        StyleWelcomeView()
        AddSplashView()
        StyleNextButton()
        StylePrivacyView()
        StylePrivacyNextBtn()
        StyleGetStartedSplash()
        StyleContinueBtn()
    
        
    }
    
    
    
    // outlets
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    
    @IBOutlet weak var GetStartedBtn: UIButton!
    
    
    @IBOutlet weak var WelcomeView: UIView!
    
    
    @IBOutlet weak var BlurEffect:
        UIVisualEffectView!
    
    @IBOutlet var PrivacyView: UIView!

    
    @IBOutlet var WelcomeSplashScreen: UIView!
    
    @IBOutlet weak var NextButton: UIButton!
    
    
    @IBOutlet weak var PrivacyNextBtn: UIButton!
    
    
    @IBOutlet var GetStartedSplash: UIView!
    
    
    @IBOutlet weak var ContinueBtn: UIButton!
    
    
    // transitions user to dashboard
    func TransitionToInterface() {
        
        
        let homeViewController =
            storyboard?.instantiateViewController(identifier:
            Constants.StoryBoard.homeViewController) as?
            InterfaceViewController
        
        
         
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
        // animates the transition
        homeViewController?.modalPresentationStyle = .fullScreen
        homeViewController?.modalTransitionStyle = .crossDissolve
        present(homeViewController!, animated: true)

    }
    
    
    
    // checks when the get started button was tapped
    @IBAction func GetStartedTapped(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.SaveIfButtonWasTap), userInfo: nil, repeats: false)
        
        DisplayWelcomeback()
        
        // gives access to user status
        let UserStatus = Defaults.value(forKey: "UserStatus") as? String ?? ""
        
        
        // checks if the user has tapped continue and if they have then transition to the dashboard
        if UserStatus.isEmpty == false {
            TransitionToInterface()
            
            
        }
        
     
    }
    
    
    
    @IBAction func NextBtnTapped(_ sender: UIButton) {
        
        // Animate the Splash screen off screen
        UIView.animate(withDuration: 1) {
            self.WelcomeSplashScreen.layer.position = CGPoint(x: 200, y: 600)
            self.WelcomeSplashScreen.alpha = 0
            
            
        }
        
        UIView.animate(withDuration: 1.5) {
            self.view.addSubview(self.PrivacyView)
            self.PrivacyView.center = self.view.center
        }
    
        
    }
    
    
    // Continue button action when tapped
    @IBAction func ContinueBtnTap(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1) {
            self.GetStartedSplash.layer.position = CGPoint(x: 200, y: 600)
            self.GetStartedSplash.alpha = 0
            self.BlurEffect.alpha = 0
        }
    }
    
    
    // Actioon when Privacy arrow button is tapped
    @IBAction func PrivacyNextBtnTap(_ sender: UIButton) {
        
        // Animate the Splash screen off screen
        UIView.animate(withDuration: 1) {
            self.PrivacyView.layer.position = CGPoint(x: 200, y: 600)
            self.PrivacyView.alpha = 0
            
            
        }
        
        UIView.animate(withDuration: 1.5) {
            self.view.addSubview(self.GetStartedSplash)
            self.GetStartedSplash.center = self.view.center
        }
        
    }
    
    
    
    // saves if the button was actually tapped
    @objc func SaveIfButtonWasTap() {
        Defaults.set("Welcome Back!", forKey: keys.Olduser)
        
        
    }
    
    
    func DisplayWelcomeback() {
        let Welcomebackdisplay = Defaults.value(forKey: keys.Olduser) as? String ?? ""
        self.WelcomeLabel.text = Welcomebackdisplay
       

        
    }
    
    func StyleWelcomeView() {
        self.WelcomeView.layer.cornerRadius = 25
        self.WelcomeView.layer.shadowColor = UIColor.lightGray.cgColor
        self.WelcomeView.layer.shadowOpacity = 0.4
        
    }
    
    func StyleSplashView() {
        // styling
        self.WelcomeSplashScreen.cornerRadius = 25
        
    }
    
    
    
    // Adds Splash view to the screen
    func AddSplashView() {
        
        let Welcomebackdisplay = Defaults.value(forKey: keys.Olduser) as? String ?? ""
        

        if Welcomebackdisplay.isEmpty == false {
            self.WelcomeSplashScreen.alpha = 0
            self.BlurEffect.alpha = 0
            
        }
        
        if Welcomebackdisplay.isEmpty == true {
            // adds view to screen
            self.view.addSubview(WelcomeSplashScreen)
            self.WelcomeSplashScreen.center = self.view.center
            self.WelcomeSplashScreen.alpha = 1
            self.BlurEffect.alpha = 1
        }
        
        
    }
    
    // Styles the button
    func StyleNextButton() {
        self.NextButton.layer.cornerRadius = 37.5
        
    }
    
    
    func StylePrivacyView() {
        
        // Styling
        self.PrivacyView.cornerRadius = 25
        
        // positioning
        self.PrivacyView.layer.position = CGPoint(x: -600, y: 200)
        
        
        
    }
    
    
    // Styles the button
    func StylePrivacyNextBtn() {
        self.PrivacyNextBtn.layer.cornerRadius = 15
      
    }
    
    func StyleGetStartedSplash() {
        
        // styling
        self.GetStartedSplash.cornerRadius = 25
        
        // positioning
        self.PrivacyView.layer.position = CGPoint(x: -600, y: 200)
        
        
    }
    
    
    func StyleContinueBtn() {
    
        // styling
        self.ContinueBtn.layer.cornerRadius = 20
        
    }
    
    
}
