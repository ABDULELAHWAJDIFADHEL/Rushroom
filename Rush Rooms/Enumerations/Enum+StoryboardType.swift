//
//  Enum+StoryboardType.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import Foundation

// MARK: - Enum for storyboard type

enum StoryboardType: String {
    case Auth
    case Home
    case Chat
    case Map
    case Setting
    case Booking
    case FilterListing
    
    var storyboardName: String {
        return rawValue
    }
}

