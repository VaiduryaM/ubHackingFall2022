//
//  LoginViewController.swift
//  medreco
//
//  Created by Narasimha Gaonkar on 11/5/22.
//

import UIKit
import Firebase
import FirebaseAuth
//import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLoginClick(_ sender: UIButton) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: userName.text ?? "", password: password.text ?? "" ) { authResult, error in
            if authResult != nil {
                print("User has Signed In")
                self.performSegue(withIdentifier: "toDashboard", sender: nil)
            }
            else {
                print("Cant Sign in user")
                
                //self.createUser()
                
                let dialogMessage = UIAlertController(title: "Alert", message: "Unable to login. Please re-check your User ID and Password!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button tapped")
                })

                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
            }
        }
        
    }
    func createUser() {
        Auth.auth().createUser(withEmail: userName.text ?? "", password: password.text ?? "") { authResult, error in
            if authResult != nil {
                print("User creted")
            }
            else{
                print("Failed")
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
