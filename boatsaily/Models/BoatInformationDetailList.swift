//
//  BoatInformationDetailList.swift
//  boatsaily
//
//  Created by yasin on 17.08.2024.
//

import Foundation

struct BoatInformationDetailList: Codable {
    var _id: String?
    var tourName: String?
    var title: String?
    var city: String?
    var town: String?
    var departureTime: String?
    var arrivedTime: String?
    var extras: String?
    var destinations: [String] = []
    var notes: String?
    var imageData: [Data] = []
    var tourDate: String?
}

struct BoatInformationTempDetailList: Codable {
    var _id: String?
    var extras: String?
    var arrivedTime: String?
    var tourName: String?
    var tourDate: String?
    var departureTime: String?
    var city: String?
    var town: String?
    var notes: String?
}


