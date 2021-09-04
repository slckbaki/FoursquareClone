//
//  ViewController.swift
//  20-Parse Foursquare Clone
//
//  Created by Selcuk Baki on 4/9/21.
//

import UIKit
import Parse


class ViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
    }

    @IBAction func signUpClick(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.password = passwordText.text!
            user.username = usernameText.text!
            user.signUpInBackground { success, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    //Segue
                    print("OK!")
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password??")
        }
    }
    @IBAction func signInClick(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { user, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    // Segue
                    print("Welcome")
                    print(user!.username!)
                }
            }
        }else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password??")
        }
    }
    
    func makeAlert(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Error", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

