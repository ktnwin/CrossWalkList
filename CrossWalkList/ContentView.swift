//
//  ContentView.swift
//  CrossWalkList
//
//  Created by Paul Inventado on 3/16/22.
//
 
import SwiftUI

struct ContentView: View {
    // TODO: Replace @State with @SceneStorage
    /* Retains value after reopening the application
     '@SceneStorage' changes are only accessible within this view */
    @SceneStorage("crosswalkName") var crosswalkName: String = ""
    @SceneStorage("crosswalkAddress") var crosswalkAddress: String = ""
    
    /* '@AppStorage' changes are accessible in ANY view
     Only works with basic data types */
    @AppStorage("sizeMultiplier") var sizeMultiplier = 1.0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                Text("Crosswalk Submission")
                    .bold()
                    .font(.largeTitle)
                }
                .padding(.bottom, 30)
                HStack {
                    Spacer()
                    NavigationLink {
                        Settings()
                    } label: {
                        Text("⚙️ Settings")
                    }
                }
                HStack {
                    Text("Crosswalk Name")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Crosswalk name", text: $crosswalkName)
                        .modifier(TextEntry())
                    Spacer()
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Crosswalk address")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                TextEditor(text: $crosswalkAddress)
                    .modifier(TextEntry())
                    .padding(.bottom, 30)
                Button(action: {
                    print("Submitted crosswalk \(crosswalkName) @ \(crosswalkAddress)")
                }) {
                    Text("Submit")
                        .modifier(ButtonDesign())
                }
                .padding(.bottom, 30)
                            
                HStack {
                    Spacer()
                    // TODO: Replace destination to other CrosswalkInfo variations
                    NavigationLink {
                        CrossWalkInfo()
                    } label: {
                        Text("ℹ️ Information about crosswalks")
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
        .font(.custom("Arial", size: CGFloat(18 * sizeMultiplier)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
