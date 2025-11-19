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
    @State var query: String = ""
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "restaurants"
    @FocusState var queryBoxFocused: Bool
    
    var body: some View {
        @Bindable var bindingModel = model
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                Button {
                    queryBoxFocused = false
                    // Perform a search
                    model.getBusinesses(query: query, options: getOptionsString(), category: categorySelection)
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
            
            // Query options. Show if textbox is focused
            if queryBoxFocused {
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
            }
            
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
                // onTap code doesn't work with Map Views
                    .onTapGesture {
                        queryBoxFocused = false
                    }
            } else {
                ListView()
                    .onTapGesture {
                        queryBoxFocused = false
                    }
            }
        }
        .sheet(item: $bindingModel.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel()) 
}
