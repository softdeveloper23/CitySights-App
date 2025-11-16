//
//  OnboardingView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 16.11.25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                                  headline: "Welcome to City Sights",
                                  subHeadline: "City Sights helps you find the best of the city!") {
                print("First screen")
            }
                .ignoresSafeArea()
            
            OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255),
                                  headline: "Discover Your City",
                                  subHeadline: "We'll show you the best restaurants, venues, and more based on your location.") {
                print("Second screen")
            }
                .ignoresSafeArea()
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
