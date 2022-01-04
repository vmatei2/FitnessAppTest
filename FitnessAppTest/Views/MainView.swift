//
//  MainView.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 02/01/2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var mainViewVM = MainViewViewModel()
    
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                
                
                
                HStack {
                    Text("Add your current weight").font(.subheadline)
                    TextField("Weight", value: $mainViewVM.weightEntry.weight, formatter: NumberFormatter())
                        .padding()
                        .keyboardType(.decimalPad)
                }
                HStack {
                    
                    DatePicker("Select date of measurement",
                               selection: $mainViewVM.weightEntry.date,
                               displayedComponents: [.date])
                }
                HStack {
                    Text("Add calories eaten yesteday").font(.subheadline)
                    TextField("Calories", value: $mainViewVM.weightEntry.calories, formatter: NumberFormatter())
                        .padding()
                        .keyboardType(.decimalPad)
                }
                Button(action:{
                    mainViewVM.save()
                    
                }, label: {
                    HStack {
                    Image(systemName: "plus.circle")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Add")
                        .fontWeight(.semibold)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(40)
                    
                    
                }).padding()
                
                NavigationLink(
                    destination: WeightEntriesListView(),
                    label: {
                        ViewPreviousEntriesButton()
                    })
            })
            .padding()
            .navigationTitle("Fitness Progress App")
        }
    }
}

struct ViewPreviousEntriesButton: View {
    var body: some View {
        Text("View Previous Entries")
            .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(40)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
