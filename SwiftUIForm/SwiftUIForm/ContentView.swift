//
//  ContentView.swift
//  SwiftUIForm
//
//  Created by siva krishna on 06/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = "Siva Krishna"
    @State private var lastName = "Perla"
    @State private var birthDate = Date()
    @State private var lookingForJobs = true
    @State private var numberOfProjects = 4

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Details")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                }
                
                Section(header: Text("Actions")) {
                    Toggle("Send Updates", isOn: $lookingForJobs)
                    Stepper("Numer of Posts \(numberOfProjects)", value: $numberOfProjects, in: 1...99)
                    Link("Check My Linked in Profile", destination: URL(string: "https://www.linkedin.com/in/siva-krishna-perla-32922653/")!)
                }
            }
            .navigationTitle("About")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyBoard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    Button("Share") {
                        share()
                    }
                }
            }
        }
        .accentColor(.secondary)
    }
    
    func share() {
        print("shared")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
