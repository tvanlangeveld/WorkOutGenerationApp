//
//  StartPageCollectionViewCell.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/15/23.
//

import UIKit

class StartPageCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellTitle: UILabel!
    
    
    func configure(with sectionName: String){
        cellTitle.text = sectionName
    }
    
    
    
}
