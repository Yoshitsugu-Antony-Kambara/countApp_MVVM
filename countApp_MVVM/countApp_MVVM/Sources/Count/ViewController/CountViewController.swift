//
//  ViewController.swift
//  countApp_MVVM
//
//  Created by 神原 良継 on 2023/03/06.
//

import UIKit

class CountViewController: UIViewController {

    private lazy var countUpText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"    //TODO: - 消す
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var incrementButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: UIControl.State())
        button.titleLabel?.font = .boldSystemFont(ofSize: 40)
        button.setTitleColor(UIColor.blue, for: UIControl.State())
        button.addTarget(self, action: #selector(didTapIncrementButton), for: .touchUpInside)
        button.frame.size.width = 100
        button.frame.size.height = 50
        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(countUpText)
        view.addSubview(incrementButton)

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        NSLayoutConstraint.activate([
            countUpText.topAnchor.constraint(equalTo: view.topAnchor),
            countUpText.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            countUpText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            incrementButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            incrementButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            incrementButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    @objc private func didTapIncrementButton() {
        print("tapped")
    }

}

