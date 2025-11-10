//
//  ListView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 10.11.25.
//

import SwiftUI

struct ListView: View {
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        
        List {
            ForEach(model.businesses) { b in
                VStack(spacing: 30) {
                    HStack(spacing: 0) {
                        Image(.listPlaceholder)
                            .padding(.trailing, 16)
                        VStack(alignment: .leading) {
                            Text(b.name ?? "Restaurant")
                                .font(Font.system(size: 15))
                                .bold()
                            Text(TextHelper.distanceAwayText(meters: b.distance ?? 0))
                                .font(Font.system(size: 16))
                                .foregroundColor(Color(red: 67/255, green: 71/255, blue: 76/255))
                        }
                        Spacer()
                        let ratingString = String(format: "%.1f", (b.rating ?? 0).roundedToHalf())
                        Image("regular_\(ratingString)")
                    }
                    Divider()
                }
                .onTapGesture {
                    model.selectedBusiness = b
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environment(BusinessModel())
}
