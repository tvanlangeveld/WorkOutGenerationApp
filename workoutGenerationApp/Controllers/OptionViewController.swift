//
//  OptionViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/11/23.
//

import UIKit



class OptionViewController: UIViewController {
    
    let workOutTypes = ["abdominals",
                        "abductors",
                        "adductors",
                        "biceps",
                        "calves",
                        "chest",
                        "forearms",
                        "glutes",
                        "hamstrings",
                        "lats",
                        "lower_back",
                        "middle_back",
                        "neck",
                        "quadriceps",
                        "traps",
                        "triceps"]
    
    @IBOutlet weak var tableView: UITableView!
    

    
    func configureViewController(){
        tableView.dataSource = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()

    }
    
}


extension OptionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workOutTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workGroupOutCell")
        cell?.textLabel?.text = workOutTypes[indexPath.row]
        
        return cell!
    }
    
    
}




