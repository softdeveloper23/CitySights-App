//
//  ContentView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 07.11.25.
//

import SwiftUI

struct MainView: View {
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        @Bindable var bindingModel = model
        VStack {
            HStack {
                TextField("What are you looking for?", text: $bindingModel.query)
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
                ForEach(bindingModel.businesses) { b in
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
                        bindingModel.selectedBusiness = b
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .onAppear{
            bindingModel.getBusinesses()
        }
        .sheet(item: $bindingModel.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
}

#Preview {
    MainView()
        .environment(BusinessModel())  // ✅ FIXED: Provide BusinessModel to preview!
}
