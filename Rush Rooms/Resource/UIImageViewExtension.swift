//
//  MovieViewController.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import UIKit

private var activityIndicatorAssociationKey: UInt8 = 0

let imageCache = NSCache<AnyObject, AnyObject>()

enum ImageSize {
    case original
    case thumbnail
}
