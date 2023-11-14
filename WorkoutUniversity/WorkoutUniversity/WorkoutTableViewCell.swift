//
//  WorkoutTableViewCell.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/12/23.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    
    @IBOutlet weak var workoutName: UILabel!
    
    @IBOutlet weak var workoutType: UILabel!
    
    
    @IBOutlet weak var workoutMuscle: UILabel!
    
    @IBOutlet weak var workoutDifficulty: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
