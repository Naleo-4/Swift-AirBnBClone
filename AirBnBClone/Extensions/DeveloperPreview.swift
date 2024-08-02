//
//  DeveloperPreview.swift
//  AirBnBClone
//
//  Created by Naleo on 7/30/24.
//

import Foundation

class DeveloperPreview{
    static let instance = DeveloperPreview()
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfBeds: 4,
            pricePerNight: 567,
            imageURLs: ["Listings-1","Listings-2","Listings-3","Listings-4"],
            latitude: 25.7850,
            longtitude: -80.1936,
            address: "124 Main St",
            city: "Miami",
            country: "USA",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amanities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        )
    ]
}
