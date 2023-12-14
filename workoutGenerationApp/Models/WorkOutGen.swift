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
    
    
    func userDidTapExercise(exercise: Exercise) {
        if let index = exercises.firstIndex(of: exercise){
            exercises.remove(at: index)
        } else{
            exercises.append(exercise)

        }
    }
    
    func isExerciseSelected(_ exercise: Exercise) -> Bool {
        exercises.contains(exercise)
    }
    
}



struct MuscleGroup {
    
    let name: String
    let image: UIImage
}




