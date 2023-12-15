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
        tableView.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()

    }
    
    
    
    @IBSegueAction func loadWorkOut(_ coder: NSCoder) -> WorkOutViewController? {
        
       if let indexPath = tableView.indexPathForSelectedRow{
            
            let workOutGroup = workOutTypes[indexPath.row]
           
           return WorkOutViewController(coder: coder, workOutType:workOutGroup )

       } else {
           return nil
       }
    }
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

extension OptionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workOutTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workGroupOutCell")
        let originalStr = workOutTypes[indexPath.row]
        let capitalString = originalStr.capitalizingFirstLetter()
        cell?.textLabel?.text = capitalString
        
        return cell!
    }
    
    
}


extension OptionViewController: UITableViewDelegate{
    
}



