//
//  TrendsView.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 07/01/2022.
//

import SwiftUI
import iLineChart

struct TrendsView: View {
    
    var weightEntries: [WeightEntry] = []
    var trendsViewVM = TrendsViewModel()
    var body: some View {
        
        iLineChart(data: trendsViewVM.weights,
                   title: "Weight Evolution",
                   style: .primary,
                   curvedLines: true,
                   displayChartStats: true)
        
        
        iLineChart(data: trendsViewVM.calories,
                   title: "Calories Consumed",
                   style: .dark,
                   curvedLines: false,
                   displayChartStats: true)
        
        
    }
    
    init(weightEntries: [WeightEntry]) {
        self.weightEntries = weightEntries
        self.trendsViewVM.weightEntries = self.weightEntries
        self.trendsViewVM.assignWeights()
    }
    
    
}

