//
//  Users+CoreDataProperties.swift
//  TheRecipeBook
//
//  Created by macOS on 19/01/22.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension Users : Identifiable {

}
