//
//  HomeController.swift
//  TheRecipeBook
//
//  Created by User on 18/01/22.
//

import UIKit

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var recipelist : [Recipe]?
    var recipename : String = ""
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return recipes.count
        return recipelist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeViewCell")!
        let recipe = recipelist?[indexPath.row]
        
        cell.textLabel?.text = recipe?.recipename ?? ""
        
        cell.detailTextLabel?.text = recipe?.recipeauthor ?? ""
            
        return cell
       
    }
    var username : String = ""
    

    @IBAction func addRecipe(_ sender: Any) {
    }
    
    @IBAction func filterAction(_ sender: Any) {
    }
    @IBOutlet weak var recipeTable: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata();
        self.recipeTable.dataSource = self
        self.recipeTable.delegate = self
        
        
    }
    
    @IBAction func addbtn(_ sender: Any) {
        performSegue(withIdentifier: "tocreate", sender: nil)
    }
    

    
    func fetchdata()
    {
        
        do
        {
            try recipelist = context.fetch(Recipe.fetchRequest())
            
        }
        catch{
            
        }
        
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete)
        {
            do
            {
                let recipe = recipelist![indexPath.row]
                context.delete(recipe)
                
                try context.save();
                fetchdata()
                tableView.reloadData()
            }
            catch
            {
                
            }
        }
 
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipelist?[indexPath.row]
        
        recipename = recipe?.recipename ?? ""
        
        performSegue(withIdentifier: "toedit", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tocreate")
        {
            let dest = segue.destination as? AddEditController
            dest?.username = username
        }
        else if (segue.identifier == "toedit")
        {
            let dest = segue.destination as? detailController
            dest?.username = username
            dest?.recipename = recipename
        }
    }
}
