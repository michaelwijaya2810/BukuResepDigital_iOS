//
//  ViewController.swift
//  TheRecipeBook
//
//  Created by User on 11/12/21.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onLogin(_ sender: Any) {
        let username: String = nameField.text ?? ""
        let password = passwordField.text ?? ""
        if(checkLogin(username: username, password: password)){
            performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        }
    }
	
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        <#code#>
    }
    
    func checkLogin(username: String, password: String) -> Bool{
        if username.isEmpty{
            return false
        }else if password.isEmpty{
            return false
        }
        return true
    }
}

