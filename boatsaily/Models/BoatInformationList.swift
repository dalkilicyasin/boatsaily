//
//  BoatInformationList.swift
//  boatsaily
//
//  Created by yasin on 27.07.2024.
//

import Foundation
import RealmSwift

class BoatInformationList: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var tourName: String?
    @Persisted var title: String?
    @Persisted var city: String?
    @Persisted var town: String?
    @Persisted var tourDate: String?
    @Persisted var departureTime: String?
    @Persisted var arrivedTime: String?
    @Persisted var extras: String?
    @Persisted var destinations = List<String>()
    @Persisted var notes: String?
    @Persisted var imageData =  List<Data>()
    
    override class func primaryKey() -> String? {
        "id"
    }
}
