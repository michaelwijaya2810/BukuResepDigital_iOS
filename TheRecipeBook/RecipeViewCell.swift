//
//  RecipeViewCell.swift
//  TheRecipeBook
//
//  Created by User on 18/01/22.
//

import UIKit

class RecipeViewCell: UITableViewCell {

    @IBOutlet weak var recipeNameTxt: UILabel!
    @IBOutlet weak var countryTxt: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
