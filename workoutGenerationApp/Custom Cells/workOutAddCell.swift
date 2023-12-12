//
//  workOutAddCell.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/12/23.
//

import UIKit


protocol workOutAddCellDelegate: AnyObject {
    func didTapBtn(exercise: Exercise)
}


class workOutAddCell: UITableViewCell {
    
    weak var delegate: workOutAddCellDelegate?
    
    var workOutInfo: Exercise?
    
    
    @IBOutlet weak var workOutName: UILabel!
    
    
//    @IBOutlet weak var workOutType: UILabel!
    
    
    
    @IBAction func addBtn(_ sender: UIButton) {
        delegate?.didTapBtn(exercise: workOutInfo!)
        
    }
    
    func setExercise(exercise: Exercise){
        workOutInfo = exercise
        workOutName.text = exercise.name

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
