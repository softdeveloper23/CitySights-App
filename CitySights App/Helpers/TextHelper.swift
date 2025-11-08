//
//  TextHelper.swift
//  CitySights App
//
//  Created by Brannon Garrett on 08.11.25.
//

import Foundation

struct TextHelper {
    static func distanceAwayText(meters: Double) -> String {
        if meters >= 1000 {
            return("\(Int(round(meters/1000))) km away")
        }
        else {
            return("\(Int(round(meters))) meters away")
        }
    }
}
