//
//  ListingDetailView.swift
//  AirBnBClone
//
//  Created by Naleo on 7/30/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView(){
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView()
                    .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background(){
                            Circle()
                                .fill(.white)
                                .frame(width: 32,height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing:2){
                        Image(systemName: "star.fill")
                        Text("Rating")
                        
                        Text(" - ")
                        
                        Text("Number Reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("Place")
                }
                .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
            
            //Host Info View
            
            HStack{
                VStack(alignment: .leading, spacing: 8){
                    Text("Hosted by Some One")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2){
                        Text("2 guests -")
                        Text("2 bedrooms -")
                        Text("2 beds -")
                        Text("2 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("Listings-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Divider()
            
            //listing features
            
            VStack(alignment: .leading,spacing: 16){
                ForEach(0 ..< 2){ feature in
                    HStack(spacing: 12){
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhost are experience, highly rated hosts who are commited to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            //bedrooms view
            
            VStack(alignment: .leading, spacing: 16){
                
                Text("Where you will slepp")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach (1 ..< 10){ place in
                            VStack{
                                Image(systemName: "bed.double")
                                Text("Bedroom \(place)")
                            }
                            .frame(width: 132, height: 80)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.gray)
                            }
                            .padding(4)
                        }
                    }
                }
                //                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            //listing amenities
            VStack(alignment: .leading, spacing: 16){
                Text("What we offer")
                    .font(.headline)
                
                ForEach( 0..<5){ feature in
                    HStack {
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        
                        Text("wifi")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you will be")
                    .font(.headline)
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack(alignment: .leading){
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before tax:")
                            .font(.footnote)
                        
                        Text("MM/DD/YYYY")
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    } label:{
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}
