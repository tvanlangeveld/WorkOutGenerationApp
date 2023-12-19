//
//  WorkOutListViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/18/23.
//

import UIKit

class WorkOutListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var selectedWorkouts: [CoreDataExercise]
    
    init?(coder: NSCoder, selectedWorkouts: [CoreDataExercise]) {
        self.selectedWorkouts = selectedWorkouts
        
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        self.selectedWorkouts = []
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    

}


extension WorkOutListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedWorkouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workOutListCell", for: indexPath)
        
        cell.textLabel?.text = selectedWorkouts[indexPath.row].name
        
        return cell
    }
    
    

    
}

extension WorkOutListViewController: UITableViewDelegate{
    
}
