//
//  CreateBoatViewModel.swift
//  boatsaily
//
//  Created by yasin on 25.07.2024.
//

import Foundation
import UIKit
import RealmSwift


class CreateBoatViewModel {
    public var tourName: String = ""
    public var title: String = ""
    public var city: String = ""
    public var town: String = ""
    public var departureTime: String = ""
    public var arrivedTime: String = ""
    public var extras: String = ""
    public var notes: String = ""
    public var tourDate: String = ""
    public var images: [UIImage] = []
    private var imageDataList: [Data] = []
    
    @ObservedResults(BoatInformationList.self) var boatInformationList
    var boatInformationTempList: [BoatInformationList] = []
    
    func saveBoatInformations() {
        let boatInformationList = BoatInformationList()
        boatInformationList.tourName = self.tourName
        boatInformationList.city = self.city
        boatInformationList.town = self.town
        boatInformationList.departureTime = self.departureTime
        boatInformationList.arrivedTime = self.arrivedTime
        boatInformationList.extras = self.extras
        boatInformationList.notes = self.notes
        boatInformationList.tourDate = self.tourDate
        
        for item in images {
            if let data = item.jpegData(compressionQuality: 0.7) {
                imageDataList.append(data)
            }
        }
        
        boatInformationList.imageData.append(objectsIn: self.imageDataList)
        
        
        self.addBoatInformation(boatInformationList)
    }
    
    func addBoatInformation(_ boatList: BoatInformationList) {
        let app = App(id: "data-ovpatrg") // MongoDB App ID
        let user = app.currentUser
        
        let client = user?.mongoClient("ClusterBoatSaily")
        let database = client?.database(named: "BoatSaily")
        let collection = database?.collection(withName: "BoatInformations")
        
        let newBoat = [
            "tourName": AnyBSON.string(boatList.tourName ?? ""),
            "city":AnyBSON.string(boatList.city ?? ""),
            "town": AnyBSON.string(boatList.tourName ?? ""),
            "departureTime":AnyBSON.string(boatList.city ?? ""),
            "arrivedTime": AnyBSON.string(boatList.tourName ?? ""),
            "extras":AnyBSON.string(boatList.city ?? ""),
            "notes": AnyBSON.string(boatList.tourName ?? ""),
            "tourDate":AnyBSON.string(boatList.city ?? "")
        ] as Document
        
        collection?.insertOne(newBoat ) { result in
            switch result {
            case .failure(let error):
                print("\(error.localizedDescription)")
            case .success(let objectId):
                print(" Your Data Has been added to Realm ObjectId: \(objectId)")
            }
        }
    }
}

