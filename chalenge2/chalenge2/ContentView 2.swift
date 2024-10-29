//
//  ContentView.swift
//  CodeChallenge2
//
//  Created by Sara Ali Alahmadi on 23/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ViweModle
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
            VStack{
                //Text(vm.Plants.count.description)
                
                if vm.Plants.isEmpty{
                    if vm.isFirstTime {
                        VStack {
                            Divider()
                            Image(.plant)
                            
                            Text("Start your plant journey")
                                .bold()
                            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                                .foregroundColor(.gray)
                            
                            ZStack{
                                Rectangle()
                                    .cornerRadius(10)
                                    .frame(width: 280.0, height: 40.0)
                                    .cornerRadius(10)
                                    .foregroundColor(Color.gree)
                                
                                Button {
                                    vm.showSetSheet = true
                                } label:{
                                    Text("Set Plant Reminder")
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                        .padding()
                        .sheet(isPresented: $vm.showSetSheet) {
                            SetSheet()
                                .environmentObject(vm)
                            
                        }
                        .navigationTitle("My Plant 🌱")
                        
                    }
                    else{
                        AllDonePage()
                    }
                }
                else{
                    RemindPlant()
                }
                
            }
        }
    }
}
struct RemindPlant: View {
    @EnvironmentObject var vm: ViweModle
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                List(vm.Plants, id: \.id, selection: $vm.multiSelection) { Plant in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(Plant.room)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text(Plant.name)
                                .font(.headline)
                                .foregroundColor(vm.multiSelection.contains(Plant.id) ? .gray : .primary)
                            
                            HStack {
                                Text("Light: \(Plant.light)")
                                    .font(.subheadline)
                                Text("Water: \(Plant.water)")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .onTapGesture {
                        vm.editingPlant = Plant // تعيين النبات الذي سيتم تعديله
                        vm.showSetSheet = true // عرض ورقة التعديل
                    }
//                    .swipeActions {
//                        Button(role: .destructive) {
//                            vm.deletePlant(plant: Plant) // حذف النبات
//                        } label: {
//                            Label("حذف", systemImage: "trash")
//                        }
//                    }
                }
                .navigationTitle("Today")
                .environment(\.editMode, .constant(.active))
                Button(action: {
                                    vm.editingPlant = nil // إعداد لإضافة نبات جديد
                                    vm.showSetSheet = true // عرض الورقة
                                }) {
                    HStack {
                        Text("New Reminder")
                            .foregroundColor(.green)
                        Label("", systemImage: "plus.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                .padding() // لإضافة حشوة حول الزر
                .frame(maxWidth: .infinity, alignment: .leading)
                .sheet(isPresented: $vm.showSetSheet) {
                    SetSheet()
                }
            }
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(ViweModle())
}
