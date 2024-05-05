//
//  SodukoApp.swift
//  Soduko
//
//  Created by Michael Danylchuk on 5/4/24.
//

import SwiftUI

@main
struct SodukoApp: App {
    var dataHandler = DataHandler()
    var body: some Scene {
        WindowGroup {
            //ContentView().environmentObject(dataHandler)
            ContentView().environmentObject(dataHandler)
        }
    }
}
