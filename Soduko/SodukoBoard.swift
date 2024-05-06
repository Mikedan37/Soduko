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
    @State var gameOver = false
    var body: some View{
        ZStack{
            Rectangle().frame(width: 400,height: 400).foregroundColor(.gray)
            if dataHandler.hasData == true{
                HStack{
                    Text("\(dataHandler.prob[0].difficulty.capitalized)").offset(y:-150).font(.title)
                    if checkForMatchWithSolution(){
                        Image(systemName: "checkmark").foregroundColor(.green).offset(x:80,y:-150)
                    }
                }
            }
            VStack{
                if dataHandler.hasData == true{
                    ForEach(0..<9){ i in
                        HStack{
                            ForEach(0..<9){ j in
                                VStack{
                                    ZStack{
                                        if (i < 3 && j<3){
                                            Rectangle().foregroundStyle(.blue).frame(width: 20,height: 20)
                                        }else if ((i>2 && i<6) && (j>2 && j<6)){
                                            Rectangle().foregroundStyle(.brown).frame(width: 20,height: 20)
                                        }else if ((i>(-1) && i<3) && (j>2 && j<6)){
                                            Rectangle().foregroundStyle(.indigo).frame(width: 20,height: 20)
                                        }else if ((i>(2) && i<6) && (j>(-1) && j<3)){
                                            Rectangle().foregroundStyle(.mint).frame(width: 20,height: 20)
                                        }else if ((i>(2) && i<6) && (j>5 && j<9)){
                                            Rectangle().foregroundStyle(.link).frame(width: 20,height: 20)
                                        }else if (i < 3 && j>5){
                                            Rectangle().foregroundStyle(.green).frame(width: 20,height: 20)
                                        }else if (i>5 && j<3){
                                            Rectangle().foregroundStyle(.purple).frame(width: 20,height: 20)
                                        }else if (i>5 && j>5){
                                            Rectangle().foregroundStyle(.orange).frame(width: 20,height: 20)
                                        }else if (i>5 && (i>3 && j<6)){
                                            Rectangle().foregroundStyle(.cyan).frame(width: 20,height: 20)
                                        }else{
                                            Rectangle().foregroundStyle(.black).frame(width: 20,height: 20)
                                        }
                                        Button("\(checkIfZero(val1: dataHandler.prob[0].value[i][j]))"){
                                            currentClicked[0] = i
                                            currentClicked[1] = j
                                            if checkForMatchWithSolution(){
                                                print("Correct")
                                            }
                                        }.buttonStyle(PlainButtonStyle()).frame(width: 20,height:20)
                                        Rectangle().foregroundColor(checkIfSelected(i: i, j: j)).frame(width: 20,height: 20).opacity(0.3)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            TextField("Values", text: $string).backgroundStyle(.white).frame(width: 50,alignment:.center).offset(x:-120,y:150).onChange(of: string){
                if string.count > 1{
                    string.removeLast()
                }
            }
            Button(action:{
                if !checkForMatchWithSolution(){
                    dataHandler.prob[0].value[currentClicked[0]][currentClicked[1]] = Int(string)!
                    if amtLives == 0{
                        gameOver = true
                    }else{
                        amtLives -= 1
                    }
                    string = ""
                }
            },label: {
                Image(systemName: "pencil")
            }).offset(x: -70,y:150).frame(width: 50).buttonStyle(PlainButtonStyle())
            
            if gameOver{
                ZStack{
                    RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black).opacity(0.8).offset(y:-15)
                    Text("Game Over").offset(y:-30)
                    HStack{
                        Button("Retry"){
                            
                        }
                        Button("Exit"){
                            exit(0)
                        }
                    }
                }.frame(width:120,height:65)
                
            }
            
            Text("Lives: \(amtLives)").offset(x:0,y:150)
            Text("Curr Index [\(currentClicked[0])] [\(currentClicked[1])]").offset(x:100,y:150)
        }
    }
    
    func checkIfSelected(i:Int, j:Int) -> Color{
        if ((i == currentClicked[0]) && (j == currentClicked[1])){
            return .red
        }else{
            return .clear
        }
    }
    
    func checkIfZero(val1:Int) -> Text{
        if val1 == 0{
            Text("   ")
        }else{
            Text("\(val1)")
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
