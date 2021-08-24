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
    
    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self]
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch Activities(rawValue: sectionIndex) {
            case .social:
                return MyDayCollectionViewLayoutFactory.socialSection()
            case .hobbies:
                return MyDayCollectionViewLayoutFactory.hobbiesSection()
            case .sleep:
                return MyDayCollectionViewLayoutFactory.sleepSection()
            case .food:
                return MyDayCollectionViewLayoutFactory.foodSection()
            case .betterMe:
                return MyDayCollectionViewLayoutFactory.betterMeSection()
            case .chores:
                return MyDayCollectionViewLayoutFactory.choresSection()
            case .diary:
                return MyDayCollectionViewLayoutFactory.diarySection()
            case .media:
                return MyDayCollectionViewLayoutFactory.mediaSection()
            case .health:
                return MyDayCollectionViewLayoutFactory.healthSection()
            case .none:
                return nil
            }
        }
        return layout
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Day"
        setUpCollectionView()
        
    }
    
    // MARK: - UI
    
    private func setUpCollectionView() {
        collectionView?.register(UINib(nibName: "ActivityItemCollectionCell", bundle: nil), forCellWithReuseIdentifier: ActivityItemCollectionCell.reuseIdentifier)
//        collectionView?.delegate = self
//        collectionView?.dataSource = self
    }
    
}

extension MyDayViewController: UICollectionViewDelegate {
    
}

extension MyDayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
