//
//  ActivityItemCollectionCell.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

class ActivityItemCollectionCell: UICollectionViewCell {
    static let reuseIdentifier = "ActivityItemCollectionCell"
    
    @IBOutlet private weak var activityIconImageView: UIImageView?
    @IBOutlet private weak var activityTitleLabel: UILabel?
}

extension ActivityItemCollectionCell {
    func populate(withActivity activity: Activity) {
        
    }
}
