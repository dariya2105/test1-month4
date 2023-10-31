//
//  NotificationController.swift
//  practice exercise
//
//  Created by User on 4/11/23.
//

import UIKit

class NotificationController: UIViewController, UITableViewDelegate {

    private let tableView = UITableView()
    private let cell = "cell"
    private var personsList: [Persons] = []
    
    private let settingsImg = MakerView.shared.makeImageView(imageName: "Setting", contentMode: .scaleToFill)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        
        tableView.separatorStyle = .none
    }
    
    private func initUI () {
        view.addSubview(tableView)
        setupConstraintsForTableView()
        
        view.addSubview(settingsImg)
        setupConstraintsForSettingsImg()
        
        initData()
    }

    private func setupConstraintsForTableView() {
           tableView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 104),
               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
           tableView.dataSource = self
           tableView.delegate = self
           tableView.register(PersonsTableViewCell.self, forCellReuseIdentifier: cell)
       }
    private func setupConstraintsForSettingsImg() {
        NSLayoutConstraint.activate([
        settingsImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 62),
        settingsImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        settingsImg.heightAnchor.constraint(equalToConstant: 28),
        settingsImg.widthAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func initData() {
        personsList = [
            Persons(image: "jane", name: "Jane Cooper has published a new recipe!", time: "Today | 09:24 AM", food: "janefood", imageDots: "dots"),
            Persons(image: "Rochel", name: "Rochel has commented on your recipe", time: "1 day ago |  14:43 PM", food: "rochelFood", imageDots: "dots"),
            Persons(image: "Brad", name: "Brad Wigington liked your comment", time: "1 day ago | 09:29 AM", food: "bradFood", imageDots: "dots"),
            Persons(image: "Tyra", name: "Tyra Ballentine has published a new recipe!", time: "2 days ago | 10:29 AM", food: "tyraFood", imageDots: "dots"),
            Persons(image: "Marci", name: "Marci Winkles has published a new recipe!", time: "3 days ago | 16:52 PM", food: "marciFood", imageDots: "dots"),
            Persons(image: "Aileen", name: "Aileen has commented your recipe", time: "4 days ago | 14:27 PM", food: "aileenFood", imageDots: "dots"),
            Persons(image: "George", name: "George has commented your recipe", time: "5 days ago | 09:20 AM", food: "georgeFood", imageDots: "dots")
        ]
    }
}

extension NotificationController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! PersonsTableViewCell
        cell.clipsToBounds = true
        //cell.initCellData(personsList[indexPath.row])
        if indexPath.row < personsList.count {
                cell.initCellData(personsList[indexPath.row])
            }
        return cell
    }
}
