//
//  DetailView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State var toDo: ToDo
    @Environment(\.modelContext) var modelContext
    let notify = NotificationHandler()
    @State private var selectedDate = Date()
    @State private var isNotificationScheduled = false // Flag to track whether a notification is scheduled
    @State private var isDateChanged = false // Flag to track if the date is changed
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Enter Item here", text: $toDo.item)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                DatePicker("Date", selection: $selectedDate, in: Date()...)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!toDo.reminderIsOn) // Disable the DatePicker when the reminder is off
                    .onChange(of: selectedDate) {
                        isDateChanged = true
                    }
                
                Button("Schedule Notification") {
                    if !isNotificationScheduled {
                        notify.sendNotification(
                            date: selectedDate,
                            type: "date",
                            title: "Reminder: \(toDo.item)",
                            body: "\(toDo.notes)")
                        isNotificationScheduled = true // Mark the notification as scheduled
                    }
                }
//                .tint(.accentColor)
                .disabled(!toDo.reminderIsOn)
                
                Text("Notes:")
                    .padding(.top)
                TextField("Leave a note for your reminder", text: $toDo.notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed:", isOn: $toDo.isCompleted)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                Spacer()
            }
            .padding()
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    modelContext.insert(toDo)
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            notify.askPermission()
        })
    }
}


#Preview {
    NavigationStack {
        DetailView(toDo: ToDo())
            .modelContainer(for: ToDo.self)
    }
}

