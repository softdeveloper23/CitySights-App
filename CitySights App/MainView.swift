//
//  ContentView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 07.11.25.
//

import SwiftUI

struct MainView: View {
    @State var businesses = [Business]()
    @State var query: String = ""
    //@State var businesses: [Business] = []
    var service = DataService()
    
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                Button {
                    // TODO: Implement query
                } label: {
                    Text("GO")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            List {
                ForEach(businesses) { b in
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
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .task {
            businesses = await service.businessSearch()
        }
    }
}

#Preview {
    MainView()
}

