//
//  WorkOutViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/11/23.
//

import UIKit



class WorkOutViewController: UIViewController, APIdelegate, UITableViewDelegate {
    
    var workOutCell = workOutAddCell()
    var workOutText: String = ""
    
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
        titleLabel.text = workOutType.capitalizingFirstLetter()
        
        tableView.register(UINib(nibName: "workOutAddCell", bundle: nil), forCellReuseIdentifier: "workOutCellID")
    }
    
}

extension WorkOutViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "workOutCellID") as! workOutAddCell
        cell.delegate = self
        let exercise = exercisesArray[indexPath.row]
        let isSelected = WorkOuts.shared.isExerciseSelected(exercise)
        cell.setExercise(exercise: exercise, isSelected: isSelected )
        return cell
        
    }
    
}


extension WorkOutViewController: workOutAddCellDelegate {
    func didTapBtn(exercise: Exercise) {
        WorkOuts.shared.userDidTapExercise(exercise: exercise)
    }
    
 
    
    
    
}
