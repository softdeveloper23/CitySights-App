//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Brannon Garrett on 07.11.25.
//

import SwiftUI
import CoreLocation

@main
struct CitySights: App {
    @State var bModel = BusinessModel()
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(bModel)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // TODO on dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                        .environment(bModel)
                }
                .onAppear {
                    // If no onboarding is needed, still get location
                    if needsOnboarding == false && bModel.locationAuthStatus == .notDetermined {
                        bModel.getUserLocation()
                    }
                }

        }
    }
}
