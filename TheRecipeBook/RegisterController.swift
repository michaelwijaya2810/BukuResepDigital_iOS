//
//  RegisterController.swift
//  TheRecipeBook
//
//  Created by User on 11/12/21.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let username: String = nameField.text ?? ""
        let password: String = passwordField.text ?? ""
        if checkRegister(username: username, password: password){
            
        }
        
    }
    
    func checkRegister(username: String, password: String) -> Bool{
        if username.isEmpty{
            return false
        }else if password.isEmpty{
            return false
        }
        return true
    }
    
    
    
}
