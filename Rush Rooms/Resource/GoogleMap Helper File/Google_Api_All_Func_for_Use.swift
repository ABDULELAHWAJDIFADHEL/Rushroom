//
//  Google_Api_All_Func_for_Use.swift
//  Vaccine Buddy
//
//  Created by Kv on 08/12/22.
//

import Foundation


//MARK: - Autocomplete
//var input = GInput()
//input.keyword = "San francisco"
//GoogleApi.shared.callApi(input: input) { (response) in
//    if let results = response.data as? [GApiResponse.Autocomplete], response.isValidFor(.autocomplete) {
//        //Enjoy the Autocomplete Api
//    } else { print(response.error ?? "ERROR") }
//}


//MARK: - Reverse Geo
//var input = GInput()
//let destination = GLocation.init(latitude: lattitude, longitude: longitude)
//input.destinationCoordinate = destination
//GoogleApi.shared.callApi(.reverseGeo , input: input) { (response) in
//    if let places = response.data as? [GApiResponse.ReverseGio], response.isValidFor(.reverseGeo) {
//        //Enjoy the ReverseGeo Api
//    } else { print(response.error ?? "ERROR") }
//}


//MARK: - Place information
//var input = GInput()
//input.keyword = "chijucwgqk6mqtkrukvhclvqfie"
//GoogleApi.shared.callApi(.placeInformation,input: input) { (response) in
//    if let place =  response.data as? GApiResponse.PlaceInfo, response.isValidFor(.placeInformation) {
//        //Enjoy the Place Api
//    } else { print(response.error ?? "ERROR") }
//}


//MARK: - Draw path
//var input = GInput()
//let origin = GLocation.init(latitude: oLattitude, longitude: oLongitude)
//let destination = GLocation.init(latitude: dLattitude, longitude: dLongitude)
//input.destinationCoordinate = destination
//input.originCoordinate = origin
//GoogleApi.shared.callApi(.path , input: input) { (response) in
//    if let path = response.data as? GApiResponse.Path, response.isValidFor(.reverseGeo) {
//        //Enjoy the Path Api
//    } else { print(response.error ?? "ERROR") }
//}


//MARK: - Nearby Places
//var input = GInput()
//input.keyword = "Restaurants"
//input.radius = 20000
//var location = GLocation()
//location.latitude = 26.273178
//location.longitude = 73.009545
//input.destinationCoordinate = location
//GoogleApi.shared.callApi(.nearBy, input: input) { (response) in
//    if let data = response.data as? [GApiResponse.NearBy], response.isValidFor(.nearBy){
//        // all nearby places
//    }
//}


//MARK: - Bonus
//Get all nearby places with extention 'GoogleApiHelper+Nearby'
//var input = GInput()
//input.keyword = "Restaurants"
//input.radius = 20000
//var location = GLocation()
//location.latitude = 26.273178
//location.longitude = 73.009545
//input.destinationCoordinate = location
//NearbyExtension.shared.completion = { response in
//    if let data = response.data as? [GApiResponse.NearBy], response.isValidFor(.nearBy){
//        // all nearby places
//    }
//}
//NearbyExtension.shared.getAllNearBy(input: input)



//MARK: - How to use?
//Step-1 - Import GoogleApiHelper to your project
//Step-2 - Initialise GoogleApi with your Api key

//GoogleApi.shared.initialiseWithKey("API_KEY")

//Step-3 - Use any api from the api with input

//var input = GInput()
//input.keyword = "San francisco"
//GoogleApi.shared.callApi(input: input) { (response) in
//    if let results = response.data as? [GApiResponse.Autocomplete], response.isValidFor(.autocomplete) {
//        //Enjoy the Autocomplete Api
//    } else { print(response.error ?? "ERROR") }
//}
