//
//  FavoriteWorkoutTableViewCell.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/14/23.
//

import UIKit

class FavoriteWorkoutTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var muscle: UILabel!
    @IBOutlet weak var diffcuilty: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
