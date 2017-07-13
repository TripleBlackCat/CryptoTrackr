//
//  UserLoginViewController.swift
//  CryptoTrackr
//
//  Created by Kavilan Nair on 2017/07/13.
//  Copyright © 2017 Kavilan Nair. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Firebase

class UserLoginViewController: UIViewController, LoginButtonDelegate {

    @IBOutlet weak var loginContainerView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.delegate = self
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        self.performSegue(withIdentifier: "navToMain", sender: nil)

        
         if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            self.performSegue(withIdentifier: "navToMain", sender: nil)
            print("Here bitch")
            print(accessToken)
            
         }
         
        
        // Do any additional setup after loading the view.
    }
    
    func loginButtonWillLogin(loginButton: LoginButton) -> Bool {
        print("will login")
        return true
    }

    
    
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        
        let credential = FacebookAuthProvider.credential(withAccessToken: (AccessToken.current?.authenticationToken)!)
        
        Auth.auth().signIn(with: credential, completion: {(user, error) in
            if let error = error {
                // ...
                print(error.localizedDescription)
                return
            }
            
            if let currentUser = Auth.auth().currentUser {
                print(currentUser.uid)
                print(currentUser.displayName)
                print(currentUser.photoURL)
            }
            
            // Navigate to the main view controller
            self.performSegue(withIdentifier: "navToMain", sender: nil)
        })
    
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            self.performSegue(withIdentifier: "navToMain", sender: nil)
            print("Here bitch")
            print(accessToken)
            
        }
    }
    
    
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }
}
