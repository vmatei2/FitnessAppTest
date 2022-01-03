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
    
    init() {
        weight = 0
        date = Date()
        calories = 0
    }
}

