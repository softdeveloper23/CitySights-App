//
//  ContentView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 07.11.25.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    @State var businesses: [Business] = []
    var service = DataService()
    
    var body: some View {
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
        .padding()
        .task {
            let _ = await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
