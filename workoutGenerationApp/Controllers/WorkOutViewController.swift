//
//  WorkOutViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/11/23.
//

import UIKit



class WorkOutViewController: UIViewController, APIdelegate {
    
    var workOutType = ""

    init?(coder: NSCoder, workOutType: String) {
        self.workOutType = workOutType
        
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var exercisesArray = [Exercise]()
    
    
    
    func exercisesRetrived(exercises: [Exercise]) {
        DispatchQueue.main.async {
            self.exercisesArray = exercises
            self.tableView.reloadData()
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APImanager.shared.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        APImanager.shared.getExercises(muscle: workOutType)
        titleLabel.text = workOutType
    }

}

extension WorkOutViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return exercisesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        cell?.textLabel?.text = exercisesArray[indexPath.row].name
        cell?.detailTextLabel!.text = exercisesArray[indexPath.row].equipment
        
        
        return cell!

    }
    
    
}


extension WorkOutViewController: UITableViewDelegate{
    
}
