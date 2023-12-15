//
//  InstructionViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/13/23.
//

import UIKit

class InstructionViewController: UIViewController {
    
    @IBOutlet weak var workOutName: UILabel!
    @IBOutlet weak var muscle: UILabel!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    let muscleGroups: [MuscleGroup] = [
        MuscleGroup(name: "abdominals", image: UIImage(named: "icons8-abs-500")!),
        MuscleGroup(name: "abductors", image: UIImage(named: "icons8-abs-500")!),
        MuscleGroup(name: "adductors", image: UIImage(named: "icons8-abs-500")!),
        MuscleGroup(name: "lower_back", image: UIImage(named: "icons8-back-muscles-500")!),
        MuscleGroup(name: "middle_back", image: UIImage(named: "icons8-back-muscles-500")!),
        MuscleGroup(name: "biceps", image: UIImage(named: "icons8-biceps-500")!),
        MuscleGroup(name: "lats", image: UIImage(named: "icons8-bodybuilder-500")!),
        MuscleGroup(name: "calves", image: UIImage(named: "icons8-calves-500")!),
        MuscleGroup(name: "forearms", image: UIImage(named: "icons8-elbow-500")!),
        MuscleGroup(name: "glutes", image: UIImage(named: "icons8-leg-500")!),
        MuscleGroup(name: "quadriceps", image: UIImage(named: "icons8-leg-500")!),
        MuscleGroup(name: "hamstrings", image: UIImage(named: "icons8-leg-500")!),
        MuscleGroup(name: "neck", image: UIImage(named: "icons8-neck-500")!),
        MuscleGroup(name: "traps", image: UIImage(named: "icons8-neck-500")!),
        MuscleGroup(name: "triceps", image: UIImage(named: "icons8-triceps-500")!),
        MuscleGroup(name: "chest", image: UIImage(named: "icons8-chest-500")!)
    ]
    
    
    var selectedWorkout: Exercise
    
    init?(coder: NSCoder, exercise: Exercise) {
        self.selectedWorkout = exercise
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
        
    }
    
    func configureScreen(){
        
        workOutName.text = selectedWorkout.name
        muscle.text = selectedWorkout.muscle
        instructions.text = selectedWorkout.instructions
        imagePlacer()
        
    }
    
    
    func imagePlacer(){
        
        let imageName = selectedWorkout.muscle
        print(imageName)
        if let index = muscleGroups.firstIndex(where: { $0.name == imageName }) {
            
            
            let selectedMuscleGroup = muscleGroups[index]
            let selectedImage = selectedMuscleGroup.image
            image.image = selectedImage
            
        }
    }
    
}











