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
            Form {
                Section {
                    TextField("Enter Item here", text: $toDo.item)
                        .font(.title)
                    VStack {
                        
                        TextField("Leave a note if needed ", text: $toDo.notes, axis: .vertical)
                    }
                }

                Section {
                    Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                    
                    DatePicker("Date", selection: $selectedDate, in: Date()...)
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
                    .disabled(!toDo.reminderIsOn)
                }

                Section {
                    Toggle("Completed:", isOn: $toDo.isCompleted)
                        .listRowSeparator(.hidden)
                }
                
                
            }
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
            
    }
    .modelContainer(for: ToDo.self)
}

