//
//  MainViewViewModel.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 03/01/2022.
//

import Foundation
import Combine

class MainViewViewModel: ObservableObject {
    @Published var weightEntryRepository = WeightEntryRepository()
    @Published var weightEntry = WeightEntry()
    private var cancellables = Set<AnyCancellable>()
    
    
    func addEntry(weightEntry: WeightEntry){
        weightEntryRepository.addEntry(entry: weightEntry)
    }
    
    func save() {
        addEntry(weightEntry: weightEntry)
    }
}
