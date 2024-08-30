//
//  AdminBoatListDetailViewModel.swift
//  boatsaily
//
//  Created by yasin on 17.08.2024.
//

import Foundation
import RealmSwift


class AdminBoatListDetailViewModel {
    @ObservedResults(BoatInformationList.self) var boatInformationList
    var boatInformation = BoatInformationDetailList()
 
    var tourName: String = ""
    
    func getDetailInfo() {
        for item in self.boatInformationList {
            if item.tourName == self.tourName {
                self.boatInformation.city = item.city
                self.boatInformation.town = item.town
                self.boatInformation.tourName = item.tourName
                self.boatInformation.arrivedTime = item.arrivedTime
                self.boatInformation.departureTime = item.departureTime
                self.boatInformation.extras = item.extras
                self.boatInformation.notes = item.notes
                self.boatInformation.imageData = Array(item.imageData)
                self.boatInformation.destinations = Array(item.destinations)
            }
        }
    }
}
