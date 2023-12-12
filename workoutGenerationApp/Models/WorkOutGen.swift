//
//  WorkOutGen.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/11/23.
//

import Foundation


class WorkOuts {
    var exercises: [Exercise] = []
    static let shared = WorkOuts()
    
    
    func addExercise(exercise: Exercise) {
        exercises.append(exercise)
    }
}
