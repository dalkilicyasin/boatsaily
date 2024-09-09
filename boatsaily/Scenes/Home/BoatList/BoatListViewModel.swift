//
//  BoatListViewModel.swift
//  boatsaily
//
//  Created by yasin on 3.09.2024.
//

import Foundation
import RealmSwift

class BoatListViewModel {
    var boatListDetailModel = BoatInformationDetailList()
    @ObservedResults(BoatInformationList.self) var boatInformationList
    var filteredBoatList: [BoatInformationDetailList] = []
    var boatInformation = BoatInformationDetailList()
    
    func callList() {
        
        self.filterBoatList(cityName: self.boatListDetailModel.city ?? "", townName: boatListDetailModel.town ?? "", date: boatInformation.tourDate ?? "")
    }
    
    func filterBoatList(cityName: String, townName: String, date: String) {
        print(self.boatInformationList)
       for item in self.boatInformationList {
           if cityName == item.city && townName == item.town {
               self.boatInformation.city = item.city
               self.boatInformation.town = item.town
               self.boatInformation.tourName = item.tourName
               self.boatInformation.arrivedTime = item.arrivedTime
               self.boatInformation.departureTime = item.departureTime
               self.boatInformation.extras = item.extras
               self.boatInformation.notes = item.notes
               self.boatInformation.imageData = Array(item.imageData)
               self.boatInformation.destinations = Array(item.destinations)
               self.filteredBoatList.append(boatInformation)
           }
        }
    }
    
}
