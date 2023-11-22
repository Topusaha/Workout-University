//
//  FavoriteWorkoutsViewController.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/13/23.
//

import UIKit

class FavoriteWorkoutsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var FavoriteWorkoutsTableView: UITableView!
    
    let favorites = Excersise.getExcercises(forKey: Excersise.favoritesKey)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavoriteWorkoutsTableView.delegate = self
        FavoriteWorkoutsTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteworkoutcell") as! FavoriteWorkoutTableViewCell
        let excersise = favorites[indexPath.row]

        cell.name.text = excersise.name
        cell.name.font = UIFont.boldSystemFont(ofSize: 16) // Adjust the font size as needed

        cell.type.text = excersise.type
        cell.muscle.text = excersise.muscle
        cell.diffcuilty.text = excersise.difficulty
        
        return cell
    }
    
    

   

}
