//
//  MainView.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 02/01/2022.
//

import SwiftUI

struct MainView: View {
    @State var weight = NumbersOnly()
    @State var calories = NumbersOnly()
    @State var date = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            
            
            Text("Weight Tracking App").font(.title)
            
            HStack {
                Text("Add your current weight").font(.subheadline)
                TextField("Weight", text: $weight.value)
                    .padding()
                    .keyboardType(.decimalPad)
            }
            HStack {
                
                DatePicker("Select date of measurement",
                           selection: $date,
                           displayedComponents: [.date])
            }
            HStack {
                Text("Add calories eaten yesteday").font(.subheadline)
                TextField("Calories", text: $calories.value)
                    .padding()
                    .keyboardType(.decimalPad)
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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
                
        })
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
