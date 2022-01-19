//
//  Ingredient+CoreDataProperties.swift
//  TheRecipeBook
//
//  Created by macOS on 19/01/22.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var ingredientname: String?
    @NSManaged public var recipeid: Int16

}

extension Ingredient : Identifiable {

}
