//
//  CatergoryCollectionViewCell.swift
//  SampleProject
//
//  Created by iRent No. 3 on 2022-03-09.
//

import UIKit

class CatergoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func generateCell(_ category: Category) {
       
        nameLabel.text = category.name
        imageView.image = category.image
    }
}
