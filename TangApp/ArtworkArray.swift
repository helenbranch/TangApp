//
//  ArtworkArray.swift
//  TangApp
//
//  Created by helen branch on 12/13/23.
//

import Foundation

class ArtworkArray: NSObject, NSCoding {
    var works: [String]

    init(works: [String]) {
        self.works = works
    }

    required init?(coder aDecoder: NSCoder) {
        self.works = aDecoder.decodeObject(forKey: "works") as? [String] ?? []
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(works, forKey: "works")
    }
}
