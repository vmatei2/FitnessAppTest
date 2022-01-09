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
    @Published var averageCalories = 0
    @Published var averageWeight: Float = 0
    
    func getData(completion: @escaping () -> Void) {
        //db reference
        // Read the documents
        
        db.collection("weightEntries").order(by: "date").getDocuments { snapshot, error in
            // Check for errors
            
            if error == nil {
                // No errors
                
                // Update the list property in the main thread
                
                
                if let snapshot = snapshot {
                    // Get all the documents and cerate weightEntry items
                    DispatchQueue.main.async {
                        self.weightEntries = snapshot.documents.map { doc in
                            let dateFormatter = DateFormatter()
                            let stamp = doc["date"] as! Timestamp
                            let convertedStamp = stamp.dateValue()
                            dateFormatter.dateFormat = "dd-MM-yyyy"
                            let date = dateFormatter.string(from: convertedStamp)
                            var displayDate: Date = Date()
                            if let convertedDate = dateFormatter.date(from: date) {
                                displayDate = convertedDate
                            }
                            
                            var weight = doc["weight"] as! Float
                            weight = Float(round(100*weight) / 100) // Convert to 2 decimal places
                            // Create wa weight entry Item
                            return WeightEntry(id: doc.documentID,
                                               weight: weight,
                                               date: displayDate,
                                               calories: doc["calories"] as! Int
                            )
                        }
                        completion()
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
    
    func calculateAverages(){
        var totalCalories: Int = 0
        var totalWeights: Float = 0
        let totalNumberOfEntries = weightEntries.count
        
        for entry in weightEntries {
            totalCalories += entry.calories
            totalWeights += entry.weight
        }
        if totalNumberOfEntries != 0 { // avoid init when we don't have any entries
            self.averageCalories = totalCalories / totalNumberOfEntries
            self.averageWeight = totalWeights / Float(totalNumberOfEntries)
        }
        print("Average Calories")
        print(self.averageCalories)
        print("Average Weight")
        print(self.averageWeight)
    }
}
