//
//  SodukoApp.swift
//  Soduko
//
//  Created by Michael Danylchuk on 5/4/24.
//

import SwiftUI

@main
struct SodukoApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var dataHandler = DataHandler()
    var body: some Scene {
        MenuBarExtra(content:{
            IntroPage().environmentObject(dataHandler).frame(width: 210,height: 120).fixedSize().frame(alignment: .center)
        },label:{
            Image(systemName: "clipboard")
        }).menuBarExtraStyle(.window)
    }
}

//struct CustomWindowStyle: WindowGroupStyle{
//    func makeBody(configuration: Configuration) -> some View{
//        configuration.content.frame(width:200,height:200)
//    }
//}
