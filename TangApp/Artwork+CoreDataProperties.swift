//
//  Artwork+CoreDataProperties.swift
//  TangApp
//
//  Created by helen branch on 12/13/23.
//
//

import Foundation
import CoreData


extension Artwork {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Artwork> {
        return NSFetchRequest<Artwork>(entityName: "Artwork")
    }

    @NSManaged public var artist: String?
    @NSManaged public var title: String?
    @NSManaged public var creationDate: String?
    @NSManaged public var materials: String?
    @NSManaged public var extendedLabel: String?
    @NSManaged public var image: String?

}

extension Artwork : Identifiable {

}
