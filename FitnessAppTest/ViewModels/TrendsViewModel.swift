//
//  TrendsViewModel.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 07/01/2022.
//

import Foundation
import Combine


class TrendsViewModel: ObservableObject {
    @Published var weights = [Double]() // array to store weight entries
    @Published var calories = [Double]() // array to store caloric entries
    var weightEntries = [WeightEntry]() // array to store weight entries
    
    
    func assignWeights(){
        for entry in self.weightEntries{
            
            self.weights.append(Double(entry.weight))
            self.calories.append(Double(entry.calories))
        }
    }
    
}
