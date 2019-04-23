//
//  JSON.swift
//  ExampleParser
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import Foundation

//Class writing to parse JSON data from API
class JSON{
    
    //method to fetch JSON Data
    func fetchImagesData(urlString : String, onComplete: @escaping (Bool, [CellViewModel])->Void){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            //Implement JSON decoding and parsing
            do {
                //Decode retrived data with JSONDecoder and assing type of CellViewModel object
                let cardsData = try JSONDecoder().decode([CellViewModel].self, from: data)
                
                //Get back to the main queue
                DispatchQueue.main.async {
                    onComplete(true, cardsData)
                }
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
            
            
            }.resume()
        
    }
}
