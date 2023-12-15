//
//  StartPageCollectionViewCell.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/15/23.
//

import UIKit

class StartPageCollectionViewCell: UICollectionViewCell {
    
    
    
    
    @IBOutlet weak var image: UIImageView!
    
    func configure(with sectionName: UIImage){
        
        image.image = sectionName
    }
    
    
    
}
