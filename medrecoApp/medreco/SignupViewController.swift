//
//  SignupViewController.swift
//  medreco
//
//  Created by Narasimha Gaonkar on 11/5/22.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet var Name: UIView!
    
    @IBOutlet weak var isDoctor: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSignup(_ sender: Any) {
        print(userName.text)
        print(password.text)
        Auth.auth().createUser(withEmail: userName.text ?? "", password: password.text ?? "") { authResult, error in
            if authResult != nil {
                self.performSegue(withIdentifier: "toDashboard", sender: nil)
            }
            else{
                let dialogMessage = UIAlertController(title: "Alert", message: "Unable to Sign you up", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button tapped")
                })

                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
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
