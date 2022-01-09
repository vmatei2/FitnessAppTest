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
    var formatter = DateFormatter()
    
    var body: some View {
        HStack(spacing: 50) {
            Text("Calories").font(.title2).padding(.leading, 10)
            Text("Weight").font(.title2)
            Text("Date").font(.title2)
            Spacer()
        }
        
        List (weightEntriesViewModel.weightEntries) { item in
            
            let weight: String = String(format: "%.2f", item.weight)
            let date: String = self.convertDate(item: item)
            HStack(spacing: 50) {
                Text("\(item.calories)").fixedSize()
                Text(weight).fixedSize()
                Text(date).fixedSize()
                Button(action: {
                    self.weightEntriesViewModel.removeEntry(weightEntry: item)
                    self.weightEntriesViewModel.getData(){self.weightEntriesViewModel.calculateAverages() }
                }, label: {
                    HStack {
                        Image(systemName: "delete.left")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                })
                Spacer()
            }
        }
        
        HStack(spacing: 80, content: {
            Text("Average Calories")
            Text("Average Weight")
        })
        HStack(spacing: 80){
            Text(String(weightEntriesViewModel.averageCalories))
            Text(String(weightEntriesViewModel.averageWeight))
        }
        .onAppear(perform: {
            self.weightEntriesViewModel.getData() {self.weightEntriesViewModel.calculateAverages() }
        }
        )
        NavigationLink(
            destination: TrendsView(weightEntries: self.weightEntriesViewModel.weightEntries),
            label: {
                Text("View Trends")
            })
    }
    
    func convertDate(item: WeightEntry) -> String {
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: item.date)
    }
    
    
}



struct WeightEntriesListView_preview: PreviewProvider {
    static var previews: some View {
        WeightEntriesListView()
    }
}
