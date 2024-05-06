//
//  introPage.swift
//  Soduko
//
//  Created by Michael Danylchuk on 5/5/24.
//

import Foundation
import SwiftUI

enum Difficulty: String, CaseIterable{
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var id: String{self.rawValue}
}

struct IntroPage: View{
    @EnvironmentObject var dataHandler:DataHandler
    @State private var selectedDifficulty = Difficulty.easy
    @State private var amtLives = 3
    var body: some View{
        ZStack{
            Rectangle().foregroundStyle(.bar).frame(width:200,height:120)
            Text("Welcome to my Soduko Game!").offset(y:-40).bold()
            HStack{
                Text("Difficulty:")
                Picker("", selection: $selectedDifficulty) {
                    ForEach(Difficulty.allCases, id: \.self){ difficulty in
                        Text(difficulty.rawValue).tag(difficulty)
                    }
                }.frame(width: 90)
            }.offset(y: -15)
            HStack{
                Spacer()
                Text("Amt Lives:")
                Spacer()
                Stepper(label:{
                        Text("\(amtLives)")
                },onIncrement: {
                    if amtLives < 10{
                        amtLives+=1
                    }
                }, onDecrement: {
                    if amtLives > 1{
                        amtLives-=1
                    }
                })
                Spacer()
            }.frame(width: 275).offset(y:10)
            HStack{
                Spacer()
                Button("Start"){
                    let newWindow = NSWindow(
                        contentRect: NSRect(x:0,y:0,width:400,height:300),styleMask: [.titled, .closable, .miniaturizable, .resizable],
                        backing: .buffered,
                        defer: false
                    )
                    newWindow.title = "Soduko Round"
                    // Create a hosting controller for your SwiftUI content
                    let hostingController = NSHostingController(rootView: ContentView().environmentObject(dataHandler))
                                    
                    // Set the hosting controller as the content view of the window
                    newWindow.contentViewController = hostingController
                                    
                    // Make the window visible
                    newWindow.makeKeyAndOrderFront(nil)
                                    
                    // Center the window on the screen
                    newWindow.center()
                }
                Spacer()
                ZStack{
                    Button("Exit"){
                        exit(0)
                    }
                }
                Spacer()
            }.offset(y:40)
        }
    }
}
