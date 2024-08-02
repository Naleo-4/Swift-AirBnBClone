//
//  ExploreViewModel.swift
//  AirBnBClone
//
//  Created by Naleo on 7/30/24.
//

import Foundation

class ExploreViewModel : ObservableObject{
    @Published var listings = [Listing]()
    private let service: ExploreService
    
    init(service: ExploreService){
        self.service = service
        
        Task {await fetchListings()}
    }
    
    func fetchListings() async{
        do{
            self.listings = try await service.fecthListings()
        } catch{
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
