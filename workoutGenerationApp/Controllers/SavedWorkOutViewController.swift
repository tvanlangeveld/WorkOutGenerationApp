//
//  SavedWorkOutViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/15/23.
//

import UIKit
import CoreData

class SavedWorkOutViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var coreDataWorkOuts = CoreDataManager.shared.fetchWorkOuts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        

        for coreDataWorkOut in coreDataWorkOuts {
            print(coreDataWorkOut.name)
            

        }
        
        
        
    }
    

    @IBSegueAction func loadedWorkOuts(_ coder: NSCoder) -> WorkOutListViewController? {
        
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedExercises = coreDataWorkOuts[indexPath.row].exercise?.allObjects as! [CoreDataExercise]
            
            return WorkOutListViewController(coder: coder, selectedWorkouts: selectedExercises)

        }
        else{
            return nil
        }
        
    }
    
}

extension SavedWorkOutViewController: UITableViewDelegate{
    
}


extension SavedWorkOutViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coreDataWorkOuts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workOutName", for: indexPath)
        
        cell.textLabel?.text = coreDataWorkOuts[indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let selectedExercises = coreDataWorkOuts[indexPath.row].exercise?.allObjects as! [CoreDataExercise]
        
        
    }
    
}





//        for coreDataWorkOut in coreDataWorkOuts {
//            let allObjects = coreDataWorkOut.exercise?.allObjects as! [CoreDataExercise]
//
//            for exercise in allObjects {
//                print(exercise.name)
//            }
//
//        }
