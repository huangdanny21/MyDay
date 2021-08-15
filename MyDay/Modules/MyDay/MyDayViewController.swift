//
//  MyDayViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

final class MyDayViewController: UIViewController, View {
    
    @IBOutlet private weak var collectionView: UICollectionView?
    
    var viewModel: MyDayViewModel!
    
    private lazy var service: MyDayService = {
        return MyDayServiceProvider()
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        
    }
}
