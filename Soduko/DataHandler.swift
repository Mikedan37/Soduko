//  DataHandler.swift
//  Soduko
//  Created by Michael Danylchuk on 5/4/24.

import Foundation
import Cocoa
import SwiftUI

class DataHandler: ObservableObject{
    var url = "https://sudoku-api.vercel.app/api/dosuku"
    @Published var isChanged = false
    @Published var prob: [Grid] = []
    @Published var hasData: Bool = false
    init(){
        Task{
            await fetchSodukoBoard()
        }
    }
    @MainActor func fetchSodukoBoard() async{
        let url = URL(string: url)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let _: Void = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print("Error: \(error.localizedDescription)")
                return
            }
            if let httpResponse = response as? HTTPURLResponse{
                print("Status code: \(httpResponse.statusCode)")
                
                if let data = data{
                    do{
                        let decode = try JSONDecoder().decode(SodukoBoard.self, from: data)
                        print(decode)
                        DispatchQueue.main.async{
                            self.prob = decode.newboard.grids
                            self.hasData = true
                        }
                    }catch{
                        print("Error parsing JSON: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }
}
