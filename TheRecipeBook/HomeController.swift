//
//  HomeController.swift
//  TheRecipeBook
//
//  Created by User on 18/01/22.
//

import UIKit

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var recipes = [Recipe]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return recipes.count
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeViewCell") as? RecipeViewCell{
            return cell
        }
        
        return UITableViewCell()
    }
    

    @IBAction func addRecipe(_ sender: Any) {
    }
    
    @IBAction func filterAction(_ sender: Any) {
    }
    @IBOutlet weak var recipeTable: UITableView!
    
    private func registerTableCells(){
        let recipeCell = UINib(nibName: "RecipeViewCell", bundle: nil)
        self.recipeTable.register(recipeCell, forCellReuseIdentifier: "RecipeViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recipeTable.dataSource = self
        self.recipeTable.delegate = self
        
        self.registerTableCells()
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
