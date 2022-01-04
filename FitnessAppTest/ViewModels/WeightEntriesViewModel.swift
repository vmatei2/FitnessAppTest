//
//  weightEntriesViewModel.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 04/01/2022.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestoreSwift

class WeightEntriesViewModel: ObservableObject {
    @Published var weightEntries = [WeightEntry]() // Published property so the code in the view will pick up any changes made to this list and update accordingly
    let db = Firestore.firestore()
    
    func getData() {
        //db reference
        // Read the documents
        
        db.collection("weightEntries").getDocuments { snapshot, error in
            // Check for errors
            
            if error == nil {
                // No errors
                
                // Update the list property in the main thread
                
                
                if let snapshot = snapshot {
                    // Get all the documents and cerate weightEntry items
                    DispatchQueue.main.async {
                        self.weightEntries = snapshot.documents.map { doc in
                            
                            let stamp = doc["date"] as! Timestamp
                            var weight = doc["weight"] as! Float
                            weight = Float(round(100*weight) / 100) // Convert to 2 decimal places
                            // Create wa weight entry Item
                            return WeightEntry(id: doc.documentID,
                                               weight: weight,
                                               date: stamp.dateValue(),
                                               calories: doc["calories"] as! Int
                            )
                        }
                    }
                }
            }
            else {
                // Handle the error
            }
        }
    }
    
    func removeEntry(weightEntry : WeightEntry) {
        if let weightEntryId = weightEntry.id {
            db.collection("weightEntries").document(weightEntryId).delete { (error) in
                if let error = error {
                    print("Unable to remove document: \(error.localizedDescription)")
                }
            }
        }
    }
}
