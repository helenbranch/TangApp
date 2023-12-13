//
//  ExhibitionInfo.swift
//  TangAppT2
//
//  Created by helen branch on 12/12/23.
//

import Foundation
import UIKit

protocol ExhibitionInfo {
    var exhibitionTitle: String { get set }
    var exhibitionLocation: String { get set }
    var exhibitionDates: String { get set }
    var exhibitionDescription: String { get set }
    var curatorInfor: String { get set }
    var includedWork: [Artwork] { get set }
}
