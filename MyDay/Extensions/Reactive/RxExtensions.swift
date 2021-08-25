import Foundation
import UIKit
import RxSwift
import RxCocoa

extension ObservableType where Element: OptionalType {
    /// Returns an Observable where the nil values from the original Observable are
    /// skipped
    func unwrappedOptional() -> Observable<Element.Wrapped> {
        return self.filter { $0.value != nil }.map { $0.value! }
    }
    
    func unwrappedOptionalAsDriver() -> Driver<Element.Wrapped> {
        return self.filter { $0.value != nil }.map { $0.value! }.asDriver(onErrorJustReturn: "" as! Self.Element.Wrapped)
    }
}

protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    public var value: Wrapped? {
        return self
    }
}

extension Reactive where Base: UIScrollView {
    var reachedBottom: ControlEvent<Void> {
        let observable = contentOffset
            .flatMap { [weak base] contentOffset -> Observable<Void> in
                guard let scrollView = base else { return Observable.empty() }

                let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
                let y = contentOffset.y + scrollView.contentInset.top
                let threshold = max(0.0, scrollView.contentSize.height - visibleHeight)

                return y > threshold ? Observable.just(()) : Observable.empty()
        }
        return ControlEvent(events: observable)
    }
}
