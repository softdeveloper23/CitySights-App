//
//  ContentView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 07.11.25.
//

import SwiftUI

struct HomeView: View {
    @Environment(BusinessModel.self) var model
    @State var selectedTab = 0
    
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
            // Show Picker
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            // Show map or list
            if selectedTab == 1 {
                MapView()
            } else {
                ListView()
            }
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
    HomeView()
        .environment(BusinessModel()) 
}
