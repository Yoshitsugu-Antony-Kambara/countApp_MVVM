//
//  File.swift
//  countApp_MVVM
//
//  Created by 神原 良継 on 2023/03/06.
//

import UIKit
import RxSwift
import RxRelay

class CountViewModel{
    //input
    let tappedIncrementButton = PublishRelay<Void>()

    //output
    let incremented: Observable<Int>

    internal init(incremented: Observable<Int>) {
        self.incremented = incremented
    }

    private func bind(model: CountModel, disposeBag: DisposeBag) -> Observable<Int> {
        let output = CountModel.transform(
            input: .init(
                tappedIncrementButton: tappedIncrementButton.asObservable()
            ),
            disposeBag: DisposeBag()
        )
        return output.incremented
    }
}
