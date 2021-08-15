//
//  MyDayViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

class MyDayViewController: UIViewController, ViewModelBased {
    
    @IBOutlet private weak var collectionView: UICollectionView?
    
    typealias ViewModelType = MyDayViewModel
    var viewModel: MyDayViewModel!
    
    private lazy var service: MyDayService = {
        return MyDayServiceProvider()
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        
    }
}
