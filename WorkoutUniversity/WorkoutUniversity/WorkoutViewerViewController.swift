//
//  WorkoutViewerViewController.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/12/23.
//

import UIKit

class WorkoutViewerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var workoutTable: UITableView!
    var data : [Excersise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTable.delegate = self
        workoutTable.dataSource = self
        fetchData { [weak self] exercises in
            self?.data = exercises
            DispatchQueue.main.async {
                self?.workoutTable.reloadData()
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutcell") as! WorkoutTableViewCell
        let excersise = data[indexPath.row]
        
        cell.workoutName.text = excersise.name
        cell.workoutType.text = excersise.type
        cell.workoutMuscle.text = excersise.muscle
        cell.workoutDifficulty.text = excersise.difficulty
        
        return cell
    }
    
    func fetchData(completion: @escaping ([Excersise]) -> Void) {
        let apiKey = "CoGoxCyj4fSBJiUQFo/OjA==YPeYhNjRKFXrSSHQ"
        let muscle = "biceps".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle="+muscle!)!
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }

            do {
                let exercises = try JSONDecoder().decode([Excersise].self, from: data)
                completion(exercises)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion([])
            }
        }

        task.resume()
    }
    
    
}
    


