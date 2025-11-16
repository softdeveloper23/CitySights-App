//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Brannon Garrett on 07.11.25.
//

import SwiftUI

@main
struct CitySights: App {
    @State var bModel = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(bModel)
                .fullScreenCover(isPresented: Binding.constant(true)) {
                    // TODO on dismiss
                } content: {
                    OnboardingView()
                }

        }
    }
}
