//
//  TableViewCell.swift
//  MyDay
//
//  Created by Danny Huang on 8/23/21.
//

import UIKit
import RxSwift

class TableViewCell: UITableViewCell {

    let bag: DisposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupUI()
    }

    func setupUI() {}
}

