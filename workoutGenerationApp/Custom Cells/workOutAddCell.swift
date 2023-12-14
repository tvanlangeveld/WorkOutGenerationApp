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
    
    var isClicked = false
    
    @IBOutlet weak var workOutName: UILabel!
    
    @IBOutlet weak var isSelectedButton: UIButton!
    
//    @IBOutlet weak var workOutType: UILabel!
    
    
    
    @IBAction func addBtn(_ sender: UIButton) {
        delegate?.didTapBtn(exercise: workOutInfo!)
        isClicked.toggle()
        setImageBtn()
        
    }
    
    func setExercise(exercise: Exercise, isSelected: Bool){
        workOutInfo = exercise
        workOutName.text = exercise.name
        isClicked = isSelected
        setImageBtn()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImageBtn(){
        
        isSelectedButton.setImage(isClicked ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle"), for: .normal)

    }
    
}
