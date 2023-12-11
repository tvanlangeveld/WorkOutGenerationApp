//
//  Managers.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/11/23.
//

import Foundation


protocol APIdelegate {
    func exercisesRetrived(exercises: [Exercise])
}

struct Exercise: Codable {
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String
}


class APImanager {
    
    
    static let shared = APImanager()
    private let baseUrl = "https://api.api-ninjas.com/v1/exercises"
    private let apiKey = "dneN0QXnFbKcEp0VcBRlEA==2YnagNPzyMCE9cM3"
    
    
    var delegate: APIdelegate?
    
    

    
    func getExercises(muscle: String) {
        
        let exercisesURL = "\(baseUrl)?muscle=\(muscle)"
        
        if let url = URL(string: exercisesURL) {
            var request = URLRequest(url: url)
            
            request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: request) { data, response, error in
                let decoder = JSONDecoder()
                
                if let error = error {
                    print("Error retrieving workouts: \(error)")
                    return
                }
                
                if let data = data {
                    
                    if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                        print(JSONString)
                    }
                    
                    do {
                        
                        let exercises = try decoder.decode([Exercise].self, from: data)
                        self.delegate?.exercisesRetrived(exercises: exercises)
                    } catch {
                        
                        print("Error decoding JSON: \(error)")
                        
                    }
                }
            }
            
            
            task.resume()
        }
    }
}

