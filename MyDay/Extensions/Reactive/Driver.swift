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
    func emptyDriverIfError() -> Driver<E> {
        return asDriver { _ in return Driver<E>.empty() }
    }

    func emptyObservableIfError() -> Observable<E> {
        return catchError { _ in return Observable<E>.empty() }
    }
}
