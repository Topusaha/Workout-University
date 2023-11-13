//
//  ExcersiceDetailedViewController.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/12/23.
//

import UIKit

class ExcersiceDetailedViewController: UIViewController {
    
    var excercise : Excersise!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var muscle: UILabel!
    @IBOutlet weak var diffculty: UILabel!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func didTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            // 1.
            excercise.addToFavorites()
        } else {
            // 2.
            excercise.removeFromFavorites()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = excercise.name
        type.text = excercise.type
        muscle.text = excercise.muscle
        diffculty.text = excercise.difficulty
        instructions.text = excercise.instructions
        
        
        instructions.adjustsFontSizeToFitWidth = true
        instructions.minimumScaleFactor = 0.5 // Adjust this value based on your preference
        
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5 // Adjust this value based on your preference
        
        type.adjustsFontSizeToFitWidth = true
        type.minimumScaleFactor = 0.5 // Adjust this value based on your preference
        
        muscle.adjustsFontSizeToFitWidth = true
        muscle.minimumScaleFactor = 0.5 // Adjust this value based on your preference
        
        diffculty.adjustsFontSizeToFitWidth = true
        diffculty.minimumScaleFactor = 0.5 // Adjust this value based on your preference
        
        
        favoriteButton.layer.cornerRadius = favoriteButton.frame.width / 2

        
    }
}
