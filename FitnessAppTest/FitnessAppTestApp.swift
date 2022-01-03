//
//  FitnessAppTestApp.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 02/01/2022.
//

import SwiftUI
import Firebase

@main
struct FitnessAppTestApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
