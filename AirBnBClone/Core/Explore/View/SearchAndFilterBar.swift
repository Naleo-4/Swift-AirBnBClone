//
//  SearchAndFilterBar.swift
//  AirBnBClone
//
//  Created by Naleo on 7/29/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack(){
            Image(systemName: "magnifyingglass" )
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Place?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Any Where - Any Time - Any One")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: {}, label:{
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 1.0)
                .foregroundStyle(.gray)
                .shadow(color: .black.opacity(0.5),radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar()
}
