//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 08.11.25.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "Business Does Not Exist!")
    }
}

#Preview {
    BusinessDetailView()
}
