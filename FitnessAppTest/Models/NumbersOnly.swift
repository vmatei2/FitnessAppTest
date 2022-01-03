//
//  NumbersOnly.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 02/01/2022.
//

import Foundation

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber}
            if value != filtered{
                value = filtered
            }
            
        }
    }
}
