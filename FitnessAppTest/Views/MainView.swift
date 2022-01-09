//
//  MainView.swift
//  FitnessAppTest
//
//  Created by Vlad Matei on 02/01/2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var mainViewVM = MainViewViewModel()
    @State private var showAlert = false // boolean to show alert on succesful db addition
    
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 50, content: {
    
                
                HStack {
                    Text("Add your current weight").font(.subheadline)
                        .foregroundColor(.black)
                    TextField("Weight", value: $mainViewVM.weightEntry.weight, formatter: NumberFormatter())
                        .padding(.leading, 150)
                        .keyboardType(.decimalPad)
                        .foregroundColor(.black)
                }
                HStack {
            
                    DatePicker("Select date of measurement",
                               selection: $mainViewVM.weightEntry.date,
                               displayedComponents: [.date])
                        .accentColor(.black)
                
                    
                }
                HStack {
                    Text("Add calories ytday").font(.subheadline)
                        .foregroundColor(.black)
                    TextField("Calories", value: $mainViewVM.weightEntry.calories, formatter: NumberFormatter())
                        .padding(.leading, 190)
                        .keyboardType(.decimalPad)
                        .foregroundColor(.black)
                }
                
                
                Button(action:{
                    showAlert = mainViewVM.save()
                    
                }, label: {
                    HStack {
                        Image(systemName: "plus.circle")
                            .font(.title)
                        Text("Add")
                            .fontWeight(.semibold)
                            .font(.title)
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(40)
                    
                    
                }
                ).padding(.top, 230)
                .alert(isPresented: $showAlert, content: {
                    Alert (title: Text("Succesfully added to database"),
                           message: Text("Weight: " + "\(mainViewVM.weightEntry.weight)"
                                            + " | Calories: " + "\(mainViewVM.weightEntry.calories)"),
                           dismissButton: .cancel())
                })
                NavigationLink(
                    destination: WeightEntriesListView(),
                    label: {
                        ViewPreviousEntriesButton()
                    })
            })
            .padding()
            .navigationTitle("Fitness Progress App 💪")
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
    }
    
}

struct ViewPreviousEntriesButton: View {
    var body: some View {
        Text("View Previous Entries")
            .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(40)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
