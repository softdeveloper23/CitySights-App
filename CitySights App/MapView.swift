//
//  MapView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 10.11.25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        Map() {
            ForEach(model.businesses, id: \.id) { business in
                Marker(business.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(latitude: business.coordinates?.latitude ?? 0, longitude: business.coordinates?.longitude ?? 0))
            }
        }
    }
}

#Preview {
    MapView()
        .environment(BusinessModel())
}
