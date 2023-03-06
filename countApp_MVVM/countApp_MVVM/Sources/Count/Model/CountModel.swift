//
//  CountViewModel.swift
//  countApp_MVVM
//
//  Created by 神原 良継 on 2023/03/06.
//

import UIKit
import RxSwift
import RxRelay

struct CountModel {

    var number: Int

    init(number: Int) {
        self.number = number
    }

    mutating func incrementNumber() {
        self.number = number + 1
    }
}
