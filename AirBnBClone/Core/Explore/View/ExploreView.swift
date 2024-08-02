//
//  ExploreView.swift
//  AirBnBClone
//
//  Created by Naleo on 7/29/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    var body: some View {
        NavigationStack(){
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView)
            }
            else {
                SearchAndFilterBar()
                    .onTapGesture {
                        withAnimation(.snappy){
                            showDestinationSearchView.toggle()
                        }
                    }
                
                ScrollView(){
                    //                SearchAndFilterBar()
                    LazyVStack{
                        ForEach(viewModel.listings){ listing in
                            NavigationLink(value: listing){
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                        }
                    }
                }
                .navigationDestination(for: Listing.self){ listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
