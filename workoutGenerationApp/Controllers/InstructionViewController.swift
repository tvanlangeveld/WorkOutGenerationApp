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
    }
}
