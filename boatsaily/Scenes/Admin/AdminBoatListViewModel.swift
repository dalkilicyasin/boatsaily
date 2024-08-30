//
//  AdminBoatListViewModel.swift
//  boatsaily
//
//  Created by yasin on 25.07.2024.
//

import Foundation
import RealmSwift

class AdminBoatListViewModel {
    
    @ObservedResults(BoatInformationList.self) var boatInformationList
    var boatInformation: BoatInformationDetailList?
    
    
    func uploadBoatList() {
        
      /* if self.boatInformationList.count > 0 {
            for item in self.boatInformationList {
                self.boatInformation?.city = item.city
                self.boatInformation?.town = item.town
                self.boatInformation?.tourName = item.tourName
                self.boatInformation?.arrivedTime = item.arrivedTime
                self.boatInformation?.departureTime = item.departureTime
                self.boatInformation?.extras = item.extras
                self.boatInformation?.notes = item.notes
                self.boatInformation?.imageData = Array(item.imageData)
                self.boatInformation?.destinations = Array(item.destinations)
            }
        }*/
    }
}
