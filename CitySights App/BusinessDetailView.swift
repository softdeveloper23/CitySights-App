//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 08.11.25.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .trailing) {
                Image(.detailPlaceholder)
                    .resizable()
                VStack {
                    Spacer()
                    Image(.yelpAttribution)
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 164)
            if let isClosed = business?.isClosed {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(isClosed ? .red : .green)
                    Text(isClosed ? "Closed" : "Open")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                }
                .frame(height: 36)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(business?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.top, 16)
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
                    Text("\(business?.location?.state ?? "") \(business?.location?.zipCode ?? ""), \(business?.location?.country ?? "")")
                        .padding(.bottom, 10)
                    let ratingString = String(format: "%.1f", (business?.rating ?? 0).roundedToHalf())
                    Image("regular_\(ratingString)")
                        .padding(.bottom, 16)
                    Divider()
                    HStack {
                        Image(systemName: "phone")
                        Text(business?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    Divider()
                    HStack {
                        Image(systemName: "globe")
                        Text(business?.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    Divider()
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reviews")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BusinessDetailView()
}
