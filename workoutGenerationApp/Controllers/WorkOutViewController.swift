//
//  WorkOutViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/11/23.
//

import UIKit



class WorkOutViewController: UIViewController, APIdelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var exercisesArray = [Exercise]()
    
    
    
    func exercisesRetrived(exercises: [Exercise]) {
        exercisesArray = exercises
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APImanager.shared.delegate = self
//        APImanager.shared.getExercises(muscle: String)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
