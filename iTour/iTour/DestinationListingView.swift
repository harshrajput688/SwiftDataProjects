//
//  DestinationListingView.swift
//  iTour
//
//  Created by Harsh Rajput on 19/06/25.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [Destination]
    var body: some View {
        List{
            ForEach(destinations){destination in
                NavigationLink(value: destination){
                    VStack(alignment: .leading){
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }
    
    init(sort: SortDescriptor<Destination>, searchString: String){
        let now = Date.now
        _destinations = Query(filter: #Predicate{
            if searchString.isEmpty{
                return true
            }else{
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteDestinations(_ indexSet: IndexSet){
        for index in indexSet{
            let destinationToDelete = destinations[index]
            modelContext.delete(destinationToDelete)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
