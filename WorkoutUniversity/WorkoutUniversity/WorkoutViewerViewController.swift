//
//  WorkoutViewerViewController.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/12/23.
//

import UIKit

class WorkoutViewerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var workoutTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTable.delegate = self
        workoutTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutcell") as! WorkoutTableViewCell
        
        return cell
    }
    

    

}
