//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Brannon Garrett on 10.11.25.
//

import Foundation
import SwiftUI

@Observable class BusinessModel {
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    var service = DataService()
    
    func getBusinesses() {
        Task {
            businesses = await service.businessSearch()
        }
    }
}
