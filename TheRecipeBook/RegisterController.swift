//
//  RegisterController.swift
//  TheRecipeBook
//
//  Created by User on 11/12/21.
//

import UIKit
import CoreData

class RegisterController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var userlist : [Users]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let username: String = nameField.text ?? ""
        let password: String = passwordField.text ?? ""
        if checkRegister(username: username, password: password){
            
            let user = Users(context: context)
            
            user.username = username;
            user.password = password;
            
            
            do
            {
                try self.context.save()
                
                self.dismiss(animated: true, completion: nil)
            }
            catch
            {
                
            }
        }
        
    }
    
    func checkRegister(username: String, password: String) -> Bool{
        if username.isEmpty{
            showAlert(msg: "Please input your username")
            return false
        }else if username.count < 3 {
            showAlert(msg: "Username must be at least 3 characters!")
            return false
        }else if password.isEmpty{
            showAlert(msg: "Please input your password!")
            return false
        }else if password.count < 6{
            showAlert(msg: "Password must be at least 6 characters!")
            return false
        }
        else
        {

            
            
            do
            {
                try userlist = context.fetch(Users.fetchRequest())
                
                for user in userlist ?? []
                {
                    if(user.username == username)
                    {
                        showAlert(msg: "Username has been taken! Please make a new username!")
                        return false
                    }
                }
                
                
                
            }
            catch
            {
                
            }
        }
        return true
    }
    func showAlert(msg: String)
    {
        let alert = UIAlertController(title: "Register Failed", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
