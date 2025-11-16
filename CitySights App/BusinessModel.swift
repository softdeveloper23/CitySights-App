//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Brannon Garrett on 10.11.25.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable class BusinessModel {
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    var service = DataService()
    var locationManager = CLLocationManager()
    
    func getBusinesses() {
        Task {
            businesses = await service.businessSearch()
        }
    }
    
    func getUserLocation() {
        // Check if we have permission
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}
