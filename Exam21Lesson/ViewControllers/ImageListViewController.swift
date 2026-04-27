//
//  ImageListViewController.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 20.04.2026.
//

import UIKit

class ImageListViewController: UIViewController {
    
    var teaDataManager: ITeaDataManager!
    
    private let cellIdentifier = "cellIdentifier"
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
}

//MARK: - Setting View
extension ImageListViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupTableView()
        
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
}
    //MARK: - UITableViewDataSource
    extension ImageListViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            teaDataManager.getAllTeas().count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            let tea = teaDataManager.getAllTeas()[indexPath.row]
            
            var configuration = cell.defaultContentConfiguration()
            configuration.text = tea.nameTea
            configuration.image = UIImage(named: tea.nameTea)
            configuration.imageProperties.maximumSize = CGSize(width: 60, height: 60)
            
            if tea.isMark {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            cell.contentConfiguration = configuration
            
            return cell
        }
    }
    
    
    //MARK: - UITableViewDelegate
    extension ImageListViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let markAction = UIContextualAction(style: .normal, title: "Mark") { _, _, complection in
                
                self.teaDataManager.toggleMark(index: indexPath.row)
                tableView.reloadRows(at: [indexPath], with: .automatic)
                
                complection(true)
            }
            
            markAction.backgroundColor = .green
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complection in
                
                self.teaDataManager.removeTea(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                complection(true)
            }
            
            let configuration = UISwipeActionsConfiguration(actions: [markAction, deleteAction])
            return configuration
        }
    }
    
    
    //MARK: - Layout
    extension ImageListViewController {
        func setupLayout() {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }
