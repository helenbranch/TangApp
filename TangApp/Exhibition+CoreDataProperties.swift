//
//  Exhibition+CoreDataProperties.swift
//  TangApp
//
//  Created by helen branch on 12/13/23.
//
//

import Foundation
import CoreData


extension Exhibition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exhibition> {
        return NSFetchRequest<Exhibition>(entityName: "Exhibition")
    }

    @NSManaged public var title: String?
    @NSManaged public var location: String?
    @NSManaged public var blurb: String?
    @NSManaged public var startDate: String?
    @NSManaged public var endDate: String?
    @NSManaged public var curatorInfo: String?
    @NSManaged internal var checklist: [String]?
    @NSManaged public var image: String?

}

extension Exhibition : Identifiable {

}
