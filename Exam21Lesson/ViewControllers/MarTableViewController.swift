//
//  MarTableViewController.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 10.05.2026.
//

import UIKit

class MarTableViewController: UITableViewController {
    
    var teaDataManager: ITeaDataManager!
    
    private let cellIdentifier = "cellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TeaCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teaDataManager.getIsMarkTeas().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath
        ) as? TeaCell else {
            return UITableViewCell()
        }
        let tea = teaDataManager.getIsMarkTeas()[indexPath.row]
        
        cell.configure(tea: tea)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
