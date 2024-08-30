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
    public var images: [UIImage] = []
    private var imageDataList: [Data] = []
    
    @ObservedResults(BoatInformationList.self) var boatInformationList
    
    func saveBoatInformations() {
        let boatInformationList = BoatInformationList()
        boatInformationList.tourName = self.tourName
        boatInformationList.city = self.city
        boatInformationList.town = self.town
        boatInformationList.departureTime = self.departureTime
        boatInformationList.arrivedTime = self.arrivedTime
        boatInformationList.extras = self.extras
        boatInformationList.notes = self.notes
        
        for item in images {
            if let data = item.jpegData(compressionQuality: 0.7) {
                imageDataList.append(data)
            }
        }
       
        boatInformationList.imageData.append(objectsIn: self.imageDataList)
        
        $boatInformationList.append(boatInformationList)
    }
}

