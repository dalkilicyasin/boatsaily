//
//  BoatListEndPoints.swift
//  boatsaily
//
//  Created by yasin on 18.09.2024.
//

import Foundation


struct BoatListEndPoints {
    
    static func getBoatList() -> Endpoint {
        Endpoint(path: "app/data-ovpatrg/endpoint/boatList")
    }
}
