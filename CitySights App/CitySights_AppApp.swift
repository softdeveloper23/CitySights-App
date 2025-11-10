//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Brannon Garrett on 07.11.25.
//

import SwiftUI

@main
struct CitySights_AppApp: App {
    @State var bModel = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(bModel)
        }
    }
}
