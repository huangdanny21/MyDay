//
//  MyDayViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

class MyDayViewController: UIViewController, ViewModelBased {
    typealias ViewModelType = MyDayViewModel
    var viewModel: MyDayViewModel!
    private lazy var service: MyDayService = {
        return MyDayServiceProvider()
    }()
}
