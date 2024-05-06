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
    @State var currentClicked = [0,0]
    @State var amtLives = 3
    var body: some View{
        ZStack{
            Rectangle().frame(width: 600,height: 600).foregroundColor(.gray)
            VStack{
                if dataHandler.hasData == true{
                    ForEach(0..<9){ i in
                        HStack{
                            ForEach(0..<9){ j in
                                VStack{
                                    Button("\(dataHandler.prob[0].value[i][j])"){
                                        currentClicked[0] = i
                                        currentClicked[1] = j
                                        if checkForMatchWithSolution(){
                                            print("Correct")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            TextField("Values", text: $string).frame(width: 50,alignment:.center).offset(x:-120,y:150).onChange(of: string){
                if string.count > 1{
                    string.removeLast()
                }
            }
            Button(action:{
                if !checkForMatchWithSolution(){
                    dataHandler.prob[0].value[currentClicked[0]][currentClicked[1]] = Int(string)!
                    string = ""
                }
            },label: {
                Image(systemName: "pencil")
            }).offset(x: -70,y:150).frame(width: 50)
            Text("Lives: \(amtLives)").offset(x:0,y:150)
        }
    }
    
    func checkForMatchWithSolution()->Bool{
        if dataHandler.prob[0].solution[currentClicked[0]][currentClicked[1]] == dataHandler.prob[0].value[currentClicked[0]][currentClicked[1]]{
            print("Same")
            return true
        }
        return false
    }
}

#Preview {
    Sodukoboard().environmentObject(DataHandler())
}
