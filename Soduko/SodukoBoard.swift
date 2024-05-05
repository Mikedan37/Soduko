//
//  SodukoBoard.swift
//  Soduko
//
//  Created by Michael Danylchuk on 5/4/24.
//

import Foundation
import SwiftUI

struct Sodukoboard: View{
    @EnvironmentObject var dataHandler: DataHandler
    @State var string = ""
    var body: some View{
        ZStack{
            Rectangle().frame(width: 400,height: 400).foregroundColor(.gray)
            VStack{
                if dataHandler.hasData == true{
                    HStack{
                        Text("HI").onAppear{
                            print(dataHandler.prob[0].value)
                        }
                    }
                }
            }
            TextField("Values", text: $string).frame(width: 50,alignment:.center).offset(x:-100,y:130).onChange(of: string){
                if string.count > 1{
                    string.removeLast()
                }
            }
            Button(action:{
                
            },label: {
                Image(systemName: "pencil")
            }).offset(x: -30,y:130).frame(width: 50)
        }
    }
}

#Preview {
    Sodukoboard().environmentObject(DataHandler())
}
