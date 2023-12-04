//
//  PartyModels.swift
//  PartyExplorer
//
//  Created by Syed Muhammad on 04/12/2023.
//

import Foundation

struct Party {
    var name: String
    var bannerImageURL: URL
    var price: Double
    var attendees: Int
    var startDate: Date
    var endDate: Date?
}
