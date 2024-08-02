//
//  ExploreService.swift
//  AirBnBClone
//
//  Created by Naleo on 7/30/24.
//

import Foundation

class ExploreService{
    func fecthListings() async throws -> [Listing]{
        return DeveloperPreview.instance.listings
    }
}
