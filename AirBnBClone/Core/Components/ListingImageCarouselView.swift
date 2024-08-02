//
//  ListingImageCarouselView.swift
//  AirBnBClone
//
//  Created by Naleo on 7/30/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    
    var body: some View {
        TabView(){
            ForEach (listing.imageURLs, id: \.self){ image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
//        .frame(height: 320)
//        .clipShape(RoundedRectangle(cornerRadius: 15))
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.instance.listings[0])
}
