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
	
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
    }
    
    func checkLogin(username: String, password: String) -> Bool{
        if username.isEmpty{
            return false
        }else if password.isEmpty{
            return false
        }
        else if(checkusernameandpassword(username: username,password: password))
        {
            return true
        }
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
}

