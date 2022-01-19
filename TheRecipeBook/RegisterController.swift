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
    
    @IBOutlet weak var errorlbl: UILabel!
    
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
            errorlbl.text = "input username"
            return false
        }else if password.isEmpty{
            errorlbl.text = "input password"
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
                        errorlbl.text = "username taken"
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
    
    
    
}
