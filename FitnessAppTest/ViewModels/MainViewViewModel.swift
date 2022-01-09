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
    @Published var weightEntry = WeightEntry(id: "Test", weight: 0, date: Date(), calories: 0)
    private var cancellables = Set<AnyCancellable>()
    
    
    func addEntry(weightEntry: WeightEntry) -> Bool {
        return weightEntryRepository.addEntry(entry: weightEntry)
    }
    
    func save() -> Bool {
        return addEntry(weightEntry: weightEntry)
    }
}
