//
//  ViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/23/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let bag: DisposeBag = DisposeBag()
    var navi: NavigationController? {
        return navigationController as? NavigationController
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    func bindViewModel() {}

    func setupUI() {
//        view.backgroundColor = App.Theme.current.package.viewBackground
    }
}
