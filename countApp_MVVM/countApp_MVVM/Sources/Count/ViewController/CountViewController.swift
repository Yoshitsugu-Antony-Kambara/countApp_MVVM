//
//  ViewController.swift
//  countApp_MVVM
//
//  Created by 神原 良継 on 2023/03/06.
//

import UIKit
import RxSwift
import RxCocoa

final class CountViewController: UIViewController {

    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var incrementButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: UIControl.State())
        button.titleLabel?.font = .boldSystemFont(ofSize: 40)
        button.setTitleColor(UIColor.blue, for: UIControl.State())
        return button
    }()

    private let disposeBag = DisposeBag()

    private let viewModel: CountViewModel

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = .init()
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(counterLabel)
        view.addSubview(incrementButton)

        addRxObserver()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        NSLayoutConstraint.activate([
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counterLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            counterLabel.heightAnchor.constraint(equalToConstant: 50),
        ])

        NSLayoutConstraint.activate([
            incrementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            incrementButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 10),
            incrementButton.widthAnchor.constraint(equalToConstant: 100),
            incrementButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func addRxObserver() {
        // input
        incrementButton.rx.tap.asObservable()
            .bind(to: viewModel.input.didTapIncrementButton)
            .disposed(by: disposeBag)

        // output
        viewModel.output.counter
            .subscribe(with: self, onNext: { owner, counter in
                owner.counterLabel.text = counter
            })
            .disposed(by: disposeBag)
    }

}

