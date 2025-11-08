//
//  DoubleRounding.swift
//  CitySights App
//
//  Created by Brannon Garrett on 08.11.25.
//

import Foundation

extension Double {
    /// Rounds the double to the nearest 0.5 increment (e.g., 3.76 -> 3.5, 3.75 -> 4.0)
    func roundedToHalf() -> Double { (self * 2).rounded() / 2 }
}
