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
    


}



extension ProfileViewController: UITableViewDelegate{
    
}


extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        WorkOuts.shared.exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileID") as! ProfileViewCell
        
        cell.name.text = WorkOuts.shared.exercises[indexPath.row].name
        
        return cell
        
    }
    
    
    
}
