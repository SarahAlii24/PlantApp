//
//  SetSheet.swift
//  CodeChallenge2
//
//  Created by Sara Ali Alahmadi on 23/04/1446 AH.
//

import SwiftUI

struct SetSheet: View {
    @Environment(\.presentationMode) var presentationMode // لإغلاق الورقة بعد الحفظ
    //    @StateObject var vm = ViweModle()
    @EnvironmentObject var vm: ViweModle
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Plant Name")
                            TextField("Enter plant name", text: $vm.PlantName)
                        }
                    }
                    Section {
                        Picker(selection: $vm.SelectedWateringDays) {
                            ForEach(vm.WateringDays, id: \.self) { option in
                                Text(option)
                            }
                        } label: {
                            Label("Watering Days", systemImage: "drop")
                        }
                        
                        Picker(selection: $vm.SelectedRoom) {
                            ForEach(vm.Room, id: \.self) { option in
                                Text(option)
                            }
                        } label: {
                            Label("Room", systemImage: "location")
                        }
                    }
                    Section {
                        Picker(selection: $vm.SelectedWater) {
                            ForEach(vm.Water, id: \.self) { option in
                                Text(option)
                            }
                        } label: {
                            Label("Water", systemImage: "drop")
                        }
                        
                        Picker(selection: $vm.SelectedLight) {
                            ForEach(vm.Light, id: \.self) { option in
                                Text(option)
                            }
                        } label: {
                            Label("Light", systemImage: "sun.max")
                        }
                    }
                    // قسم حذف النبات، يظهر فقط إذا كان هناك نبات يتم تعديله
                    if vm.editingPlant != nil {
                                        Section {
                                            Button(action: {
                                                // تأكد من أنك قد قمت بتحديد النبات الذي تريد حذفه
                                                if let plantToDelete = vm.editingPlant {
                                                    vm.deletePlant(plant: plantToDelete)

                                                    // تحقق مما إذا كانت قائمة النباتات فارغة
                                                    if vm.Plants.isEmpty {
                                                        // الانتقال إلى صفحة AllDonePage
                                                        vm.showAllDonePage = true
                                                    } else {
                                                        presentationMode.wrappedValue.dismiss() // إغلاق الورقة بعد الحذف
                                                    }
                                                }
                                            }) {
                                                Text("Delete Reminder")
                                                    .frame(maxWidth: .infinity)
                                                    .multilineTextAlignment(.center)
                                                    .font(.system(size: 20))
                                                    .padding(.vertical, 8)
                                                    .foregroundColor(.red) // لون الزر يمكن أن يكون أحمر
                                            }
                                        }
                                    }
                                }
                                .navigationBarTitle(vm.editingPlant == nil ? "Set Reminder" : "Edit Reminder", displayMode: .inline)
                                .navigationBarItems(
                                    leading: Button("Cancel") {
                                        presentationMode.wrappedValue.dismiss() // إغلاق الورقة عند الإلغاء
                                    }
                                    .foregroundColor(.green),
                                    
                                    trailing: Button("Save") {
                                        if let editingPlant = vm.editingPlant {
                                            vm.updatePlant(editingPlant) // تحديث النبات
                                        } else {
                                            vm.savePlant() // حفظ نبات جديد
                                        }
                                        presentationMode.wrappedValue.dismiss() // إغلاق الورقة بعد الحفظ
                                    }
                                    .foregroundColor(.green)
                                )
                                .onAppear {
                                    // عند ظهور الورقة، إعداد القيم للنبات الذي يتم تعديله
                                    if let editingPlant = vm.editingPlant {
                                        vm.PlantName = editingPlant.name
                                        vm.SelectedWater = editingPlant.water
                                        vm.SelectedLight = editingPlant.light
                                        vm.SelectedRoom = editingPlant.room
                                    }
                                }
                            }
                            .fullScreenCover(isPresented: $vm.showAllDonePage) {
                                AllDonePage() // صفحة AllDonePage
                    }
        }
    }
}
#Preview {
    SetSheet()
        .environmentObject(ViweModle())
}
//if plantToEdit != nil {
//    Section {
//        Button(action: deletPlant){
//            Text("Delet Reminder")
//                .frame(maxWidth: .infinity)
//                .multilineTextAlignment(.center)
//                .font(.system(size: 20))
//                .padding(.vertical, 8)
//        }
//    }
//}
//}
//.navigationBarTitle(plantToEdit == nil ? "Set Reminder" : "Edit Reminder", displayMode: .inline)
