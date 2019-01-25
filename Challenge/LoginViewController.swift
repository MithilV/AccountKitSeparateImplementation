//
//  LoginViewController.swift
//  Challenge
//
//  Created by mithil on 1/17/19.
//  Copyright © 2019 mithil. All rights reserved.
//

import UIKit
import AccountKit
class LoginViewController: UIViewController, AKFViewControllerDelegate  {
    var accountKit: AKFAccountKit!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signinButton: UIButton!
    
    @IBOutlet weak var img: UIImageView!
    func prepareLoginViewController(loginViewController: AKFViewController){
        loginViewController.delegate = self
        loginViewController.uiManager = AKFSkinManager(skinType: .classic, primaryColor: UIColor.red)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if accountKit == nil{
            accountKit = AKFAccountKit(responseType: .accessToken)
        }
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage?("aesthetic.jpg"))
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "aesthetic.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //login button style
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.layer.borderWidth = 1.0
        loginButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        loginButton.tintColor = UIColor.clear
        loginButton.layer.cornerRadius = 20
        loginButton.center.x = self.view.center.x
        
        //Sign In Button style
        signinButton.setTitle("Sign Up", for: .normal)
        signinButton.titleLabel?.textColor = UIColor.white
        signinButton.layer.borderWidth = 1.0
        signinButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        signinButton.tintColor = UIColor.clear
        signinButton.layer.cornerRadius = 20
        signinButton.center.x = self.view.center.x
        
    }
    @IBAction func signinAction(_ sender: UIButton) {
        self.loginWithPhone()
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        //if loginButton.tintColor = UIColor.clear {
        //  loginButton.backgroundColor = UIColor.green
        self.loginWithPhone()
        //}
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
           // if accountKit?.currentAccessToken != nil{
                //if user logged in go to main screen
                print("user logged in go to view controller")
               // DispatchQueue.main.async(execute:{
                //    self.performSegue(withIdentifier: "loginSeg", sender: self)
              //  })
                
                
          //  }
          //  else{
                //show login screen
        //    }
        
    }
    
    
    
    
    func loginWithPhone(){
        let inputState = UUID().uuidString
        let vc = (accountKit?.viewControllerForPhoneLogin(with: nil, state: inputState))!
        vc.enableSendToFacebook = true
        self.prepareLoginViewController(loginViewController: vc)
        self.present(vc as UIViewController, animated: true, completion: nil)
    }
 
    //Buttons
    
    
    

         func viewController(viewController: UIViewController!, didCompleteLoginWithAccessToken accessToken: AKFAccessToken!, state: String!){
            print("did complete login with access token \(accessToken.tokenString) state \(state)")
        }
        
        func viewController(_ viewController: (UIViewController & AKFViewController)!, didCompleteLoginWithAuthorization code: String!,state: String!) {
            print("didCompleteLoginWithAuthorizationCode")
        }
        func viewController(_ viewController: (UIViewController & AKFViewController)!, didFailWithError error: Error!) {
            print("\(viewController) did fail with error: \(error.localizedDescription) ")
        }
        func viewControllerDidCancel(_ viewController: (UIViewController & AKFViewController)!) {
            print("ViewControllerDidCancel")
        }
        
        func viewController(_ viewController: (UIViewController & AKFViewController)!, didCompleteLoginWith accessToken: AKFAccessToken!, state: String!) {
            print("didCompleteLoginWith")
        }
    
}


