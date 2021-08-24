//
//  Driver.swift
//  MyDay
//
//  Created by Danny Huang on 8/23/21.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    func emptyDriverIfError() -> Driver<Element> {
        return asDriver { _ in return Driver<Element>.empty() }
    }

    func emptyObservableIfError() -> Observable<Element> {
        return catchError { _ in return Observable<Element>.empty() }
    }
}
