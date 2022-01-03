//
//  WeightEntryRepository.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 03/01/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class WeightEntryRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var weightEntries = [WeightEntry]() // Published allows us to create observable objects that automatically announce when changes occur
                                                   // SwiftUI will automatically monitor for changes and re-invoke the body property of view that rely on this data
    init() {
        loadData()
    }
    
    func loadData(){
        db.collection("weightEntries").addSnapshotListener { querySnapshot, Error in
            if let querySnapshot = querySnapshot {
                self.weightEntries = querySnapshot.documents.compactMap({document in
                    do {
                        return try document.data(as: WeightEntry.self)
                    }
                    catch {
                        print(error)
                    }
                    return nil
                })
            }
        }
    }
    
    func addEntry(entry: WeightEntry){
        do {
            let _ = try db.collection("weightEntries").addDocument(from: entry)
        }
        catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
}
