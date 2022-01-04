//
//  WeightEntry.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 03/01/2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct WeightEntry: Codable, Identifiable {
    @DocumentID var id: String?
    var weight: Float
    var date: Date
    var calories: Int
    
    init(id: String, weight: Float, date:Date, calories: Int) {
        self.id = id
        self.weight = weight
        self.date = date
        self.calories = calories
    }
}

