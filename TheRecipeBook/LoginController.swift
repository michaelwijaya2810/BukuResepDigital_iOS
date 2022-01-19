//
//  ViewController.swift
//  TheRecipeBook
//
//  Created by User on 11/12/21.
//

import UIKit
import CoreData
class LoginController: UIViewController {

    
    
  
    @IBOutlet weak var usernametxt: UITextField!
    
    @IBOutlet weak var passsword: UITextField!
    
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var userlist : [Users]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onLogin(_ sender: Any) {
        let username: String = usernametxt.text ?? ""
//        let username = "test2"
        let password = passsword.text ?? ""
//        let password = "test"
        if(checkLogin(username: username, password: password)){
            
            performSegue(withIdentifier: "tomenu", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tomenu")
        {
            let dest = segue.destination as? HomeController
            dest?.username = usernametxt.text ?? "" 
        }
    }
	
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    func checkLogin(username: String, password: String) -> Bool{
        if username.isEmpty{
            showAlert(msg: "Please input your username!")
            return false
        }else if password.isEmpty{
            showAlert(msg: "Please input your password!")
            return false
        }
        else if(checkusernameandpassword(username: username,password: password))
        {
            return true
        }
        showAlert(msg: "Username/password is wrong. Please check it again!")
        return false
    }
    
    
    func checkusernameandpassword(username:String, password : String) -> Bool
    {
            do{
                try userlist = self.context.fetch(Users.fetchRequest())
                
                        for user in userlist  ?? []
                        {
                            if(user.username == username && user.password == password)
                            {
                                
                                return true;
                            }

                        }
            }
            catch
            {
                
            }
            
            
            return false;
    }
    
    func showAlert(msg: String)
    {
        let alert = UIAlertController(title: "Login Failed", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

