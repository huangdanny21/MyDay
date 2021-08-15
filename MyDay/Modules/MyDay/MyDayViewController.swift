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
                return MyDayCollectionViewLayout.socialSection()
            case .hobbies:
                return MyDayCollectionViewLayout.hobbiesSection()
            case .sleep:
                return MyDayCollectionViewLayout.sleepSection()
            case .food:
                return MyDayCollectionViewLayout.foodSection()
            case .betterMe:
                return MyDayCollectionViewLayout.betterMeSection()
            case .chores:
                return MyDayCollectionViewLayout.choresSection()
            case .diary:
                return MyDayCollectionViewLayout.diarySection()
            case .media:
                return MyDayCollectionViewLayout.mediaSection()
            case .health:
                return MyDayCollectionViewLayout.healthSection()
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
