//
//  PersonsTableViewCell.swift
//  practice exercise
//
//  Created by User on 5/11/23.
//

import UIKit

class PersonsTableViewCell: UITableViewCell {

    private let bgView = MakerView.shared.makeView(color: .clear)
    
    private let faceImage = MakerView.shared.makeImageView(contentMode: .scaleToFill)
    
    private let nameLabel = MakerView.shared.makeLabel(size: 18,
                                                       textColor: .black,
                                                       numberOfLines: 2)
    
    private let timeLabel = MakerView.shared.makeLabel(size: 14,
                                                       weight: .regular,
                                                       textColor: .systemGray)
    
    private let foodImage = MakerView.shared.makeImageView(contentMode: .scaleToFill)
    
    private let imageOfDots = MakerView.shared.makeImageView(imageName: "dots",
                                                             contentMode: .scaleToFill)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
    }
    
    private func initUI() {
        contentView.addSubview(bgView)
        setupConstraintsForBgView()
        
        bgView.addSubview(faceImage)
        setupConstraintsForFaceImage()
        
        bgView.addSubview(nameLabel)
        setupConstraintsForNameLabel()
        
        bgView.addSubview(timeLabel)
        setupConstraintsForTimeLabel()
        
        bgView.addSubview(foodImage)
        setupConstraintsForFoodImage()
        
        bgView.addSubview(imageOfDots)
        setupConstraintsForImageOfDots()
    }
    
    private func setupConstraintsForBgView() {
                NSLayoutConstraint.activate([
                    bgView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
                    bgView.heightAnchor.constraint(equalToConstant: 74)
                ])
    }
    
    private func setupConstraintsForFaceImage() {
        NSLayoutConstraint.activate([
                    faceImage.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 38),
                    faceImage.widthAnchor.constraint(equalToConstant: 48),
                    faceImage.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func setupConstraintsForNameLabel() {
        NSLayoutConstraint.activate([
                        nameLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 24),
                        nameLabel.leadingAnchor.constraint(equalTo: faceImage.trailingAnchor, constant: 12),
                        nameLabel.widthAnchor.constraint(equalToConstant: 198)
        ])
    }
    
    private func setupConstraintsForTimeLabel() {
        NSLayoutConstraint.activate([
                    timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 14),
                    timeLabel.leadingAnchor.constraint(equalTo: faceImage.trailingAnchor, constant: 12),
                    timeLabel.widthAnchor.constraint(equalToConstant: 198)
                ])
    }
    
    private func setupConstraintsForFoodImage() {
        NSLayoutConstraint.activate([
                foodImage.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 24),
                foodImage.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 12)
        ])
    }
    
    private func setupConstraintsForImageOfDots() {
        NSLayoutConstraint.activate([
            imageOfDots.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 55),
            //imageOfDots.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 12),
            imageOfDots.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
            imageOfDots.heightAnchor.constraint(equalToConstant: 24),
            imageOfDots.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func initCellData(_ persons: Persons) {
            faceImage.image = UIImage(named: persons.image)
            nameLabel.text = persons.name
            timeLabel.text = persons.time
            foodImage.image = UIImage(named: persons.food)
            imageOfDots.image = UIImage(named: persons.imageDots)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
