//
//  DestinationSearchView.swift
//  AirBnBClone
//
//  Created by Naleo on 7/30/24.
//

import SwiftUI

enum DestinationOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var fromDate = Date()
    @State private var toDate = Date()
    @State private var numGuests = 0
    @State private var selectedOption : DestinationOptions = .location
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack {
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                } label:{
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !destination.isEmpty{
                    Button("Clear"){
                        destination = ""
                        fromDate = Date()
                        toDate = Date()
                        numGuests = 0
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search Destination", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 40)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }
                else{
                    ExtractedView(title: "Where", description: "Add locations")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy){ selectedOption = .location }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                if selectedOption == .dates{
                    Text("When's your trips?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $fromDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $toDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                else{
                    ExtractedView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy){ selectedOption = .dates }
            }
            
            
            VStack(alignment: .leading, spacing: 8) {
                if selectedOption == .guests{
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper{
                        Text("\(numGuests) Adults")
                    } onIncrement:{
                        numGuests += 1
                    } onDecrement:{
                        guard numGuests > 0 else {return}
                        numGuests -= 1
                    }
                    
//                    HStack{
//                        Image(systemName: "magnifyingglass")
//                            .imageScale(.small)
//                        TextField("Search Destination", text: $destination)
//                            .font(.subheadline)
//                    }
//                    .frame(height: 40)
//                    .padding(.horizontal)
//                    .overlay{
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
//                            .foregroundStyle(Color(.systemGray4))
//                    }
                }
                else{
                    ExtractedView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy){ selectedOption = .guests }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct ExtractedView: View {
    let title: String
    let description:String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
