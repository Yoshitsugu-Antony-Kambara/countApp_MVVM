//
//  CountViewModel.swift
//  countApp_MVVM
//
//  Created by 神原 良継 on 2023/03/06.
//

import UIKit
import RxSwift
import RxRelay

class CountModel {

    struct Input {
        let tappedIncrementButton: Observable<Void>
    }

    struct Output {
        let incremented: Observable<Int>
    }


    static func transform(input: Input, disposeBag: DisposeBag) -> Output {
        let numberRelay = BehaviorRelay<Int>(value: 0)
        var currentNumber: Int = 0

        input.tappedIncrementButton
            .map { () -> Int in
                currentNumber = numberRelay.value
                currentNumber = currentNumber + 1
                return currentNumber
            }
            .bind(to: numberRelay)
            .disposed(by: disposeBag)

        return Output(
            incremented: numberRelay.asObservable()
        )
    }
}
