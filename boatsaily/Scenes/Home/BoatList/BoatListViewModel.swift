//
//  BoatListViewModel.swift
//  boatsaily
//
//  Created by yasin on 3.09.2024.
//

import Foundation
import RealmSwift
import Alamofire

class BoatListViewModel {
    var boatListDetailModel = BoatInformationDetailList()
    @ObservedResults(BoatInformationList.self) var boatInformationList
    var filteredBoatList: [BoatInformationDetailList] = []
    var boatInformation = BoatInformationDetailList()
    
    func callList() {
        NetworkManager.shared.callRealmData(type: [BoatInformationTempDetailList].self, url: "https://eu-central-1.aws.data.mongodb-api.com/app/data-ovpatrg/endpoint/boatList", method: .post) { [weak self] response in
            switch response {
            case .success(let boatList):
                print("\(boatList)")
               // self?.filteredBoatList = boatList
            case .failure(let error):
                print("\(error)")
            }
        }
        
        self.filterBoatList(cityName: self.boatListDetailModel.city ?? "", townName: boatListDetailModel.town ?? "", date: boatInformation.tourDate ?? "")
    }
    
    func filterBoatList(cityName: String, townName: String, date: String) {
        print(self.boatInformationList)
        
        let app = App(id: "data-ovpatrg") // MongoDB App ID
        let user = app.currentUser
        
        let client = user?.mongoClient("ClusterBoatSaily")
        let database = client?.database(named: "BoatSaily")
        let collection = database?.collection(withName: "BoatInformations")
        
        let filter: Document = ["city":AnyBSON.string(cityName)]
        
        collection?.find(filter: filter) { result in
            switch result {
            case .failure(let error):
                print("Veriler çekilirken hata oluştu: \(error.localizedDescription)")
            case .success(let documents):
                // Başarıyla verileri aldık
                print("İstanbul'daki turlar:")
                for document in documents {
                    print(document)
                }
            }
        }
        
      /* for item in self.boatInformationList {
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
        }*/
    }
    
}
