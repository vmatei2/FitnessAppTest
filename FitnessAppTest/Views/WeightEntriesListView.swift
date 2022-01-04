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
                Button(action: {
                    self.weightEntriesViewModel.removeEntry(weightEntry: item)
                    self.weightEntriesViewModel.getData()
                }, label: {
                    HStack {
                    Image(systemName: "delete.left")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Remove")
                        .fontWeight(.semibold)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                })
            }
        }.onAppear(perform: {
            self.weightEntriesViewModel.getData()
        })
    }
    
    init() {
        weightEntriesViewModel.getData()
    }
}
