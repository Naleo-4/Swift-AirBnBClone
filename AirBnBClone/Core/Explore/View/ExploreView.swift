//
//  ExploreView.swift
//  AirBnBClone
//
//  Created by Naleo on 7/29/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
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
                        ForEach(0 ... 10, id: \.self){ listings in
                            NavigationLink(value: listings){
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                        }
                    }
                }
                .navigationDestination(for: Int.self){ listings in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
