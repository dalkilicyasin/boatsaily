//
//  HomeViewModel.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var cityList = ["Antalya", "İstanbul", "Kocaeli"]
    var townList = ["Kaş", "Fethiye", "Kemer"]
    var selectedCity = ""
    var selectedTown = ""
    var selectedTag = 0
    
    func getCityList() {
        /*
        NetworkManager.shared.callLocaitonList(type: CityResponseModel.self, chosenLocation: "cities") { [weak self] response in
            
            switch response {
            case .success(let cityModel):
                self?.cityList = cityModel.Turkey?.cities ?? []
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }*/
        let networkService = HomeNetworkService()
        networkService.getCityList { [weak self] result in
            switch result {
            case .success(let data):
                print("\(data)")
                self?.cityList = data.Turkey?.cities ?? []
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
        
    }
    
    func getTownList(_ selectedCity: String) {
        NetworkManager.shared.callLocaitonList(type: TownResponseModel.self, chosenLocation: "towns") { [weak self] response in
            switch response {
            case .success(let towntModel):
                if let filteredCity = towntModel.Turkey?.cityTowns?.filter({ $0.city == selectedCity}) {
                    guard !filteredCity.isEmpty else {return}
                    self?.townList = filteredCity[0].towns ?? []
                }
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
