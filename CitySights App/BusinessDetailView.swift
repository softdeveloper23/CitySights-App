//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Brannon Garrett on 08.11.25.
//

import SwiftUI

struct BusinessDetailView: View {
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        let business = model.selectedBusiness
        
        VStack(spacing: 0) {
            ZStack(alignment: .trailing) {
                if let imageUrl = business?.imageUrl {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 164)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }

                } else {
                    Image(.detailPlaceholder)
                        .resizable()
                }
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
                        Text("""
                            ABC Company is dedicated to providing high-quality products and outstanding customer service to every client. Our team takes pride in delivering reliable solutions that meet a wide range of customer needs. With a focus on professionalism and integrity, we strive to create a positive experience for everyone we serve.
                            
                            At ABC Company, we believe in building lasting relationships through trust, transparency, and exceptional service. Our goal is to exceed expectations by offering dependable solutions and personalized attention. Whether you’re a new or returning customer, we’re committed to ensuring your satisfaction every step of the way.
                            """)
                        .multilineTextAlignment(.leading)
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone")
                        if let url = URL(string: "tel:\(business?.phone ?? "")") {
                            Link(destination: url) {
                                Text(business?.phone ?? "")
                            }
                        } else {
                            Text(business?.phone ?? "")
                        }
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    Divider()
                    HStack {
                        Image(systemName: "globe")
                        if let url = URL(string: "\(business?.url ?? "")") {
                            Link(destination: url) {
                                Text(business?.url ?? "")
                                    .lineLimit(1)
                            }
                        } else {
                            Text(business?.url ?? "")
                                .lineLimit(1)
                        }
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    Divider()
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reviews")
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
        .environment(BusinessModel())
}
