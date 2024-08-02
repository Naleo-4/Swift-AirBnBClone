//
//  ListingItemView.swift
//  AirBnBClone
//
//  Created by Naleo on 7/29/24.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 10){
            //image
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            //listing Details
            HStack(alignment: .top){
                //details
                VStack(alignment: .leading) {
                    Text("\(listing.city),\(listing.country)")
                        .fontWeight(.semibold)
                    Text("Date")
                        .foregroundStyle(.gray)
                    Text("Duration")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4){
                        Text("Prices")
                            .fontWeight(.semibold)
                        Text("/night")
                    }
                }
                
                Spacer()
                
                //rating
                HStack(spacing:2){
                    Image(systemName: "star.fill")
                    Text("Rating")
                }
            }
            .font(.footnote)
            .padding(5)
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.instance.listings)
}
