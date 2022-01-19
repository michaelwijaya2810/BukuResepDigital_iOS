//
//  AddEditController.swift
//  TheRecipeBook
//
//  Created by User on 18/01/22.
//

import UIKit
import DropDown
import CoreData

class AddEditController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    
    
    

    

    @IBAction func doneBtn(_ sender: Any) {
    }
    @IBAction func backBtn(_ sender: Any) {
    }
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var imgPicker: UIImageView!
    @IBAction func descTxt(_ sender: Any) {
    }
    @IBOutlet weak var spinnerView: UIView!
    @IBOutlet weak var spinnerTxt: UILabel!
    
    @IBOutlet weak var spinnertxt2: UILabel!
    
    @IBOutlet weak var steptbl: UITableView!
    @IBOutlet weak var ingredientbl: UITableView!
    let dropdown = DropDown()
    let dropdownOpt = ["Indonesian", "American", "Italian", "Chinese", "Japanese", "Korean", "Others"]
    
    let dropdown2 = DropDown()
    let dropdownopt2 = ["rice", "pizza&pasta", "Italian", "Chinese", "Japanese", "Korean", "Others"]
    
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var recipelist : [Recipe]?;
    var arringredient : [Ingredient]?
    var arrstep : [Step]?
    var username : String = "";
    var ingredientlist : [String] = []
    var steplist :[String] = []
    var country : String = ""
    var type : String = ""
    
    var steplistadd : [Step]?
    var ingredientlistadd : [Ingredient]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerTxt.text = "Select the recipe's country"
        setdropdown();
        
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            spinnerTxt.text = "\(item)"
            country = "\(item)"
        }
        
        dropdown2.selectionAction = { [unowned self] (index: Int, item: String) in
            spinnertxt2.text = "\(item)"
            type = "\(item)"
        }
        
        ingredienttbl.dataSource = self
        steptbl.dataSource = self
        
        ingredienttbl.delegate = self
        steptbl.delegate = self
        
        
    }
    
    
    
    
    

    @IBAction func backbtn(_ sender: Any) {
        self.dismiss(animated: true)
    }

    
    
    @IBOutlet weak var recipedesctxt: UITextField!
    
    @IBAction func savebtn(_ sender: Any) {
        print("something wong")
        if(checkrecipeunique(recipename: recipeTitle.text ?? ""))
        {

            let recipe = Recipe(context: context)
            
            recipe.recipecountry = country
            recipe.recipetype = type
            recipe.recipename = recipeTitle.text
            recipe.recipedesc = recipedesctxt.text
            recipe.recipeauthor = username
            recipe.recipeid = Int16(fetchnextid() + 1);
            
            do
            {
                try context.save()
     
            }
            catch
            {
                
            }
//            print("steplist")
//            print(steplist.count)
            
            
            
            for ingredient in ingredientlist
            {
                var ingredientadd = Ingredient(context: context)
                
                ingredientadd.ingredientname = ingredient
                ingredientadd.recipename = recipeTitle.text ?? ""
                
                do
                {
                    try context.save()

                }
                catch
                {
                    
                }
            }
            
            for step in steplist
            {
                var steplistadd = Step(context: context)
                
                steplistadd.stepname = step
                steplistadd.recipename = recipeTitle.text ?? ""
                
                do
                {
                    try context.save()

                }
                catch
                {
                    
                }
            }
            
            
            
          
                performSegue(withIdentifier: "tomenufromcreate", sender: nil)
            
        }
        else
        {

        }
//
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tomenufromcreate")
        {
            let dest = segue.destination as? HomeController
            
            dest?.username = username
        }
        
    }
    
    
    // table controller

        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
    
    
    @IBOutlet weak var ingredienttbl: UITableView!
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
            switch tableView {
                
                case ingredienttbl:
                numberOfRow = ingredientlist.count
                case steptbl:
                    numberOfRow = steplist.count
                default:
                    print("Some things Wrong!!")
                }
        return numberOfRow
    }
    

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
           var cell2 = UITableViewCell()
        switch tableView
        {
        case ingredienttbl:
            
            cell = ingredienttbl.dequeueReusableCell(withIdentifier:"ingredientcell", for: indexPath)
            
            var item : String = ingredientlist[indexPath.row]
            cell.textLabel?.text = item
//            cell.detailTextLabel?.text = item
        case steptbl:
            cell = steptbl.dequeueReusableCell(withIdentifier: "stepcell", for: indexPath)
            let item : String = steplist[indexPath.row]
            cell.textLabel?.text = item
        default:
            print("Some things Wrong!!in data")
        }
        
      return cell
    }
        
    
        
    
    // end of table controller
    
    
    //dropdown
    func setdropdown()
    {
        dropdown.anchorView = spinnerView
        dropdown.dataSource = dropdownOpt
        
        dropdown.bottomOffset = CGPoint(x: 0, y: (dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown.topOffset = CGPoint(x: 0, y:-(dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown.direction = .bottom
        
        
        
        
        dropdown2.anchorView = spinnerView
        dropdown2.dataSource = dropdownopt2
        
        dropdown2.bottomOffset = CGPoint(x: 0, y: (dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown2.topOffset = CGPoint(x: 0, y:-(dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown2.direction = .bottom
    }
    

    @IBAction func showCountryOpt(_ sender: Any) {
        dropdown.show()
        
        
    }
    
    @IBAction func showtype(_ sender: Any) {
        dropdown2.show()
    }
    
    //end of dropdown
    
    
    
    func fetchnextid() -> Int
    {
        
        do{
            try recipelist = context.fetch(Recipe.fetchRequest())
        }
        catch
        {
            
        }
        
        
        return recipelist?.count ?? 0;
    }
    
    
    func checkrecipeunique(recipename : String) -> Bool
    {
       
        let fetchRequest: NSFetchRequest<Recipe>
        fetchRequest = Recipe.fetchRequest()

        fetchRequest.predicate = NSPredicate(
            format: "recipename == %@", recipename)
        var recipecheck : [Recipe]
        
        do
        {
            try recipecheck = context.fetch(fetchRequest)
            if(!recipecheck.isEmpty)
            {
                if(recipecheck[0].recipename == recipename)
                {
                    return false
                }
                else{
                    return true
                }
            }
            
        }
        catch
        {
            
        }
        
        
        return true;
        
    }
    
    
    //add ingredient
    
    @IBOutlet weak var ingredientfieldtxt: UITextField!
    @IBAction func addingredientbtn(_ sender: Any) {

        if(ingredientfieldtxt.text != "")
        {



            ingredientlist.append(ingredientfieldtxt.text ?? "")



            ingredienttbl.reloadData()

        }



    }
    
    
    
    //end of add ingredient
    
    
    //add step
    
    @IBOutlet weak var stepfieldtxt: UITextField!
    @IBAction func addstepbtn(_ sender: Any) {
        if(stepfieldtxt.text != "")
        {
            
        
            
            steplist.append(stepfieldtxt.text ?? "")
            
            steptbl.reloadData()
            
            
            
            
        }
    }
    
    
    
    
    //end of add step
    
    
    
}
