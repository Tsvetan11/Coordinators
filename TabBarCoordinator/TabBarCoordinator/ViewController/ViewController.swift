//
//  ViewController.swift
//  TabBarCoordinator
//
//  Created by Tsvetan Tsvetanov on 21.06.23.
//

import UIKit

struct ViewControllerButton {
    let title: String
    let action: () -> Void
}

class ViewController: UIViewController {

    private let titleText: String
    private let color: UIColor
    private let buttons: [ViewControllerButton]
    private var uiButtons: [UIButton] = []

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        return stack
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 36)
        label.textAlignment = .center
        return label
    }()

    init(
        title: String,
        color: UIColor,
        buttons: [ViewControllerButton]
    ) {
        self.titleText = title
        self.color = color
        self.buttons = buttons

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        configureLayouts()
    }

    private func configureViews() {
        view.backgroundColor = color
        titleLabel.text = titleText

        stackView.addArrangedSubview(titleLabel)

        view.addSubview(stackView)

        buttons.forEach { buttonItem in
            let button = UIButton(
                configuration: .filled(),
                primaryAction: UIAction(
                    title: buttonItem.title,
                    handler: { _ in
                        buttonItem.action()
                    }
                )
            )

            button.setTitleColor(.purple, for: .normal)
            button.setTitleColor(.white, for: .normal)

            uiButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }

    private func configureLayouts() {

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
}
