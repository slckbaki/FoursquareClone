//
//  PlaceModel.swift
//  20-Parse Foursquare Clone
//
//  Created by Selcuk Baki on 12/9/21.
//

import Foundation
import UIKit
class PlaceModel {
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init(){}
}
