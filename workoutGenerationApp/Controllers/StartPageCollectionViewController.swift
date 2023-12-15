//
//  StartPageCollectionViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/15/23.
//

import UIKit



class StartPageCollectionViewController: UICollectionViewController {
    
    @IBOutlet var collectionVIew: UICollectionView!
    
    let dataSource: [String] = ["Work Out Builder", "Saved Work Outs", "Stop Watch"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let titlePageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? StartPageCollectionViewCell {
         
            titlePageCell.configure(with: dataSource[indexPath.row])
            
            cell = titlePageCell
        }
        
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
            
            
            
        case 0:
            
            let vc = storyboard?.instantiateViewController(identifier: "OptionViewController", creator: { coder in
                let firstVC = OptionViewController(coder: coder)
                return firstVC
            })
            self.navigationController?.pushViewController(vc!, animated: true)

            
            
        case 1:
            
            let vc = storyboard?.instantiateViewController(identifier: "SavedWorkOutsViewController", creator: { coder in
                let firstVC = SavedWorkOutViewController(coder: coder)
                return firstVC
            })
            self.navigationController?.pushViewController(vc!, animated: true)
            
        case 2:
            let vc = storyboard?.instantiateViewController(identifier: "StopWatchViewController", creator: { coder in
                let firstVC = StopWatchViewController(coder: coder)
                return firstVC
            })
            self.navigationController?.pushViewController(vc!, animated: true)
            
            
        default:
            break
        }
    }
}
