//
//  Recipe+CoreDataProperties.swift
//  TheRecipeBook
//
//  Created by macOS on 19/01/22.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }
    @NSManaged public var recipeauthor: String?
    @NSManaged public var recipename: String?
    @NSManaged public var recipecountry: String?
    @NSManaged public var recipedesc: String?
    @NSManaged public var recipetype: String?
    @NSManaged public var recipeid: Int16

}

extension Recipe : Identifiable {

}
