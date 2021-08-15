//
//  MyDayViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

final class MyDayViewController: UIViewController, StoryBoardInit, View {
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle? { return Bundle.main }
    static var storyboardIdentifier: String? { return "MyDayViewController" }
    
    @IBOutlet private weak var collectionView: UICollectionView?
    
    var viewModel: MyDayViewModel!
    
    private lazy var service: MyDayService = {
        return MyDayServiceProvider()
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Day"
    }
}
