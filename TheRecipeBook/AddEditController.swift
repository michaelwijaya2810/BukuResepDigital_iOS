//
//  AddEditController.swift
//  TheRecipeBook
//
//  Created by User on 18/01/22.
//

import UIKit
import DropDown

class AddEditController: UIViewController {

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
    
    
    let dropdown = DropDown()
    let dropdownOpt = ["Indonesian", "American", "Italian", "Chinese", "Japanese", "Korean", "Others"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerTxt.text = "Select the recipe's country"
        dropdown.anchorView = spinnerView
        dropdown.dataSource = dropdownOpt
        
        dropdown.bottomOffset = CGPoint(x: 0, y: (dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown.topOffset = CGPoint(x: 0, y:-(dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown.direction = .bottom
    }
    
    @IBAction func showCountryOpt(_ sender: Any) {
        dropdown.show()
    }

}
