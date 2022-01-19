//
//  Step+CoreDataProperties.swift
//  TheRecipeBook
//
//  Created by macOS on 19/01/22.
//
//

import Foundation
import CoreData


extension Step {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Step> {
        return NSFetchRequest<Step>(entityName: "Step")
    }

    @NSManaged public var stepname: String?
    @NSManaged public var recipeid: Int16

}

extension Step : Identifiable {

}
