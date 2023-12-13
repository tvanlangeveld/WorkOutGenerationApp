//
//  WorkOutGen.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/11/23.
//

import Foundation
import UIKit


class WorkOuts {
    var exercises: [Exercise] = []
    static let shared = WorkOuts()
    
    
    func addExercise(exercise: Exercise) {
        if !exercises.contains(where: { $0 == exercise }) {
            exercises.append(exercise)
        }
    }
}



struct MuscleGroup {
    
    let name: String
    let image: UIImage
}




