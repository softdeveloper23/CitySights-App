//
//  OnboardingView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 16.11.25.
//

import SwiftUI

struct OnboardingView: View {
    @State var selectedViewIndex = 0
    
    var body: some View {
        TabView(selection: $selectedViewIndex) {
            OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                                  headline: "Welcome to City Sights",
                                  subHeadline: "City Sights helps you find the best of the city!") {
                withAnimation {
                    selectedViewIndex = 1
                }
            }
                                  .tag(0)
                                  .ignoresSafeArea()
            
            OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255),
                                  headline: "Discover Your City",
                                  subHeadline: "We'll show you the best restaurants, venues, and more based on your location.") {
                print("Second screen")
            }
                                  .tag(1)
                                  .ignoresSafeArea()
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
