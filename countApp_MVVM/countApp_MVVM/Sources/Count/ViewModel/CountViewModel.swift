//
//  File.swift
//  countApp_MVVM
//
//  Created by 神原 良継 on 2023/03/06.
//

import UIKit
import RxSwift
import RxRelay

protocol CountViewModelInput {
    var didTapIncrementButton: PublishRelay<Void> { get }
}
protocol CountViewModelOutput {
    var counter: BehaviorRelay<String> { get }
}
protocol CountViewModelType {
    var input: CountViewModelInput { get }
    var output: CountViewModelOutput { get }
}

final class CountViewModel: CountViewModelType, CountViewModelInput, CountViewModelOutput {

    var input: CountViewModelInput { self }
    var output: CountViewModelOutput { self }

    // input
    let didTapIncrementButton: PublishRelay<Void> = PublishRelay()

    // output
    private(set) var counter: BehaviorRelay<String> = BehaviorRelay(value: "0")

    // extra
    private let disposeBag = DisposeBag()
    private var model: CountModel

    init() {
        // modelの生成
        self.model = CountModel(number: 0)

        didTapIncrementButton
            .subscribe(with: self) { owner, _ in
                // modelが定数なので変数にしない限り`mutating func`が使えない。
                owner.model.incrementNumber()

                // modelの値をcounterに流している。
                owner.counter.accept(String(owner.model.number))
            }
            .disposed(by: disposeBag)
    }
}
