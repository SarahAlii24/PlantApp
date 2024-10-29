//
//  AllDonePage.swift
//  CodeChallenge2
//
//  Created by Sara Ali Alahmadi on 23/04/1446 AH.
//

import SwiftUI

struct AllDonePage: View {
    @StateObject var vm = ViweModle()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
            VStack {
                Divider()
                Image(.plant2)
                
                Text("All Done 🎉")
                    .bold()
                Text("All Reminders Completed")
                    .foregroundColor(.gray)
            }
                }
        .environment(\.editMode, .constant(.active))
        Button(action: {
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
#Preview {
    AllDonePage()
        .environmentObject(ViweModle())
}
