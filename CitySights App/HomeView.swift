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
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "restaurants"
    
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
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
            }
            .padding(.horizontal)
            
            // Query options
            VStack {
                Toggle("Popular", isOn: $popularOn)
                Toggle("Deals", isOn: $dealsOn)
                
                HStack {
                    Text("Category")
                    Spacer()
                    Picker("Category", selection: $categorySelection) {
                        Text("Restaurants")
                            .tag("restaurants")
                        Text("Arts")
                            .tag("arts")
                    }
                }
            }
            .padding(.horizontal, 40)
            
            // Show Picker
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
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
