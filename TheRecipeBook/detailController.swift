//
//  detailController.swift
//  TheRecipeBook
//
//  Created by macOS on 19/01/22.
//

import UIKit
import CoreData

class detailController: UIViewController,UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var ingredienttbl: UITableView!
    
    @IBOutlet weak var steptbl: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == ingredienttbl)
        {
            return ingredientlist?.count ?? 0
        }
        else
        {
            return steplist?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == ingredienttbl{
            let ingredient = ingredientlist?[indexPath.row]
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell")
                    
            cell?.textLabel?.text = ingredient?.ingredientname
                    
                    return cell!
                }
                else{
                    let step = steplist?[indexPath.row]
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "StepCell")
                    
                    cell?.textLabel?.text = step?.stepname
                    
                    return cell!
                }
        
    }
    
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var typelbl: UILabel!
    @IBOutlet weak var countrylbl: UILabel!
    @IBOutlet weak var recipedesclbl: UILabel!
    var recipename : String = ""
    var username : String = ""
    var recipelist : [Recipe]?
    var ingredientlist : [Ingredient]?
    var steplist : [Step]?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata(recipename: recipename)
        
        ingredienttbl.dataSource = self
        steptbl.dataSource = self
        
        titlelbl.text = recipename
        
        recipedesclbl.text = recipelist?[0].recipedesc
        countrylbl.text = recipelist?[0].recipecountry
        typelbl.text = recipelist?[0].recipetype
    }
    
    
    func fetchdata(recipename : String)
    {
        let fetchRequest: NSFetchRequest<Recipe>
               fetchRequest = Recipe.fetchRequest()

               fetchRequest.predicate = NSPredicate(
                   format: "recipename == %@", recipename
                   
               )
               
               do
               {
                   try recipelist = context.fetch(fetchRequest)
       
               }
               catch
               {
                   
               }
        
        let fetchRequest2: NSFetchRequest<Ingredient>
               fetchRequest2 = Ingredient.fetchRequest()

               fetchRequest2.predicate = NSPredicate(
                   format: "recipename == %@", recipename
                   
               )
               
               do
               {
                   try ingredientlist = context.fetch(fetchRequest2)
       
               }
               catch
               {
                   
               }
        
        let fetchRequest3: NSFetchRequest<Step>
               fetchRequest3 = Step.fetchRequest()

               fetchRequest3.predicate = NSPredicate(
                   format: "recipename == %@", recipename
                   
               )
               
               do
               {
                   try steplist = context.fetch(fetchRequest3)
       
               }
               catch
               {
                   
               }
        
        
    }
    

}
