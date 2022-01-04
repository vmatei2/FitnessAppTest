//
//  WeightEntriesListView.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 04/01/2022.
//

import Foundation
import SwiftUI
import Firebase

struct WeightEntriesListView: View {
    
    @ObservedObject var weightEntriesViewModel = WeightEntriesViewModel()
    
    var body: some View {
        HStack {
            Text("Calories Eaten").font(.title2)
            Text("Weight").font(.title2)
            Text("Date").font(.title2)
        }
        
        List (weightEntriesViewModel.weightEntries) { item in
            let weight: String = String(format: "%.2f", item.weight)
            HStack {
                Text("\(item.calories)")
                Text(weight)
                Text("\(item.date)")
            }
        }.onAppear(perform: {
            self.weightEntriesViewModel.getData()
        })
    }
    
    init() {
        weightEntriesViewModel.getData()
    }
}
