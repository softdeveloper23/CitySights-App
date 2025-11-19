//
//  DataService.swift
//  CitySights App
//
//  Created by Brannon Garrett on 07.11.25.
//

import Foundation
import CoreLocation

struct DataService {
    //let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?, query: String?, options: String?, category: String?) async -> [Business]{
        // Check if api key exists
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String, !apiKey.isEmpty else {
            print("Missing API key")
            return [Business]()
        }
        // Default Lat & Long
        var lat = 37.785834
        var long = -122.406417
        // User Lat & Long
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        var endpointUrlString = "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&limit=10"
        
        // Add query
        if query != nil && query != "" {
            endpointUrlString.append("&term=\(query!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
        }
        // Add options
        if options != nil && options != "" {
            endpointUrlString.append("&attributes=\(options!)")
        }
        // Add category
        if let category = category {
            endpointUrlString.append("&category=\(category)")
        }
        
        // Create URL
        if let url = URL(string: endpointUrlString) {
            
            // Create Request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            // Test diagnostics
            do {
                let (data, response) = try await URLSession.shared.data(for: request)

                if let http = response as? HTTPURLResponse {
                    print("Status code:", http.statusCode)
                }
                // Testing to see a response from API
                if let body = String(data: data, encoding: .utf8) {
                    print("Response body:", body)
                }

                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                print("Decoded businesses count:", result.businesses.count)
            } catch {
                print("Decoding error:", error)
            }
            
            // Send Actual Request
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
            } catch {
                print(error)
            }
            
        }
        return [Business]()
    }
}
