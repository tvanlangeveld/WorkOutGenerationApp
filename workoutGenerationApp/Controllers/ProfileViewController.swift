//
//  ProfileViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/12/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ProfileViewCell", bundle: nil), forCellReuseIdentifier: "profileID")

    }
    
    
    
//    @IBAction func saveWorkOut(_ sender: UIBarButtonItem) {
//        
//        var textField = UITextField()
//        
//        let alert = UIAlertController(title: "Name Work Out", message: "", preferredStyle: .alert)
//        
//        let action = UIAlertAction(title: "Save Work Out", style: .default)
//        
//        
//    }
    
    
    
    
    @IBAction func resetBtn(_ sender: Any) {
        
        WorkOuts.shared.exercises = []
        tableView.reloadData()
    }
    
    
    
    
    
    
    @IBSegueAction func loadInstruction(_ coder: NSCoder) -> InstructionViewController? {
        
        
        if let indexPath = tableView.indexPathForSelectedRow{
            
            let selectedWorkout = WorkOuts.shared.exercises[indexPath.row]
            
            return InstructionViewController(coder: coder, exercise: selectedWorkout)

        } else{
            return nil
        }
        
    }
    

}



extension ProfileViewController: UITableViewDelegate{
    
}


extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        WorkOuts.shared.exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCellID", for: indexPath)
        
    
        cell.textLabel?.text = WorkOuts.shared.exercises[indexPath.row].name
        
        return cell
        
    }
    
    
    
    
}
