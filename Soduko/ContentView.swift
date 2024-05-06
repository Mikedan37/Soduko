//
//  ContentView.swift
//  Soduko
//
//  Created by Michael Danylchuk on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataHandler: DataHandler
    var body: some View {
        VStack {
            Sodukoboard()
            // [][][] [][][] [][][]
            // [][][] [][][] [][][]
            // [][][] [][][] [][][]
    
            // [][][] [][][] [][][]
            // [][][] [][][] [][][]
            // [][][] [][][] [][][]
            
            // [][][] [][][] [][][]
            // [][][] [][][] [][][]
            // [][][] [][][] [][][]
            
            // [1,2,3, 4,5,6, 7,8,9]
            // [1,2,3, 4,5,6, 7,8,9]
            // [1,2,3, 4,5,6, 7,8,9]
            
            // [1,2,3, 4,5,6, 7,8,9]
            // [1,2,3, 4,5,6, 7,8,9]
            // [1,2,3, 4,5,6, 7,8,9]
            
            // [1,2,3, 4,5,6, 7,8,9]
            // [1,2,3, 4,5,6, 7,8,9]
            // [1,2,3, 4,5,6, 7,8,9]
        }
        .padding()
    }
}

#Preview {
    ContentView().environmentObject(DataHandler())
}
