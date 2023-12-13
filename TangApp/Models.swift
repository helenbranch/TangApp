//
//  Models.swift
//  TangApp
//
//  Created by helen branch on 12/13/23.
//

import Foundation

struct ExhibitionData: Codable {
    let data: [ExhibitionItem]
}

//structs for exhibition item and artwork item so they are convertable from JSON
struct ExhibitionItem: Codable {
    let title: String
    let location: String
    let startDate: String
    let endDate: String
    let description: String
    let curationInfo: String
    let mainImage: String
    let imageGallery: [String]
}

struct ArtworkItem: Codable {
    let artist: String
    let title: String
    let creationDate: Int
    let materials: String
    let extendedLabel: String
    let imageURL: String
}
