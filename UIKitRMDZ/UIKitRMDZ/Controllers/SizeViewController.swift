// SizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SizeViewController: UIViewController {
    // MARK: - Constants

    private enum Constant {
        static let size = "Выберите размер"
        static let size35 = "35 ЕU"
        static let size36 = "36 ЕU"
        static let size37 = "37 ЕU"
        static let size38 = "38 ЕU"
        static let size39 = "39 ЕU"
    }

    // MARK: - Visual

    private let under35View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()

    private let under36View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()

    private let under37View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()

    private let under38View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()

    private let under39View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()

    private let size35Label: UILabel = {
        let label = UILabel()
        label.text = Constant.size35
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    private let size36Label: UILabel = {
        let label = UILabel()
        label.text = Constant.size35
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    private let size37Label: UILabel = {
        let label = UILabel()
        label.text = Constant.size35
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    private let size38Label: UILabel = {
        let label = UILabel()
        label.text = Constant.size35
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    private let size39Label: UILabel = {
        let label = UILabel()
        label.text = Constant.size35
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }

    // MARK: - Private methods

    private func setupViewController() {
        view.backgroundColor = .white
        view.addSubview(size35Label)
        view.addSubview(size36Label)
        view.addSubview(size37Label)
        view.addSubview(size38Label)
        view.addSubview(size39Label)
        view.addSubview(under35View)
        view.addSubview(under36View)
        view.addSubview(under37View)
        view.addSubview(under38View)
        view.addSubview(under39View)

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: .x.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(dismissed)
        )
        navigationItem.title = Constant.size

        makesize35Constraints()
        makesize36Constraints()
        makesize37Constraints()
        makesize38Constraints()
        makesize39Constraints()
        makeUnder35Constraints()
        makeUnder36Constraints()
        makeUnder37Constraints()
        makeUnder38Constraints()
        makeUnder39Constraints()
    }

    private func makesize35Constraints() {
        size35Label.translatesAutoresizingMaskIntoConstraints = false
        size35Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        size35Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 77).isActive = true
        size35Label.widthAnchor.constraint(equalToConstant: 278).isActive = true
        size35Label.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    private func makesize36Constraints() {
        size36Label.translatesAutoresizingMaskIntoConstraints = false
        size36Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        size36Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 114).isActive = true
        size36Label.widthAnchor.constraint(equalToConstant: 278).isActive = true
        size36Label.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    private func makesize37Constraints() {
        size37Label.translatesAutoresizingMaskIntoConstraints = false
        size37Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        size37Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 151).isActive = true
        size37Label.widthAnchor.constraint(equalToConstant: 278).isActive = true
        size37Label.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    private func makesize38Constraints() {
        size38Label.translatesAutoresizingMaskIntoConstraints = false
        size38Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        size38Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 188).isActive = true
        size38Label.widthAnchor.constraint(equalToConstant: 278).isActive = true
        size38Label.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    private func makesize39Constraints() {
        size39Label.translatesAutoresizingMaskIntoConstraints = false
        size39Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        size39Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 225).isActive = true
        size39Label.widthAnchor.constraint(equalToConstant: 278).isActive = true
        size39Label.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    private func makeUnder35Constraints() {
        under35View.translatesAutoresizingMaskIntoConstraints = false
        under35View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        under35View.topAnchor.constraint(equalTo: view.topAnchor, constant: 103).isActive = true
        under35View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        under35View.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func makeUnder36Constraints() {
        under36View.translatesAutoresizingMaskIntoConstraints = false
        under36View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        under36View.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        under36View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        under36View.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func makeUnder37Constraints() {
        under37View.translatesAutoresizingMaskIntoConstraints = false
        under37View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        under37View.topAnchor.constraint(equalTo: view.topAnchor, constant: 177).isActive = true
        under37View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        under37View.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func makeUnder38Constraints() {
        under38View.translatesAutoresizingMaskIntoConstraints = false
        under38View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        under38View.topAnchor.constraint(equalTo: view.topAnchor, constant: 214).isActive = true
        under38View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        under38View.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func makeUnder39Constraints() {
        under39View.translatesAutoresizingMaskIntoConstraints = false
        under39View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        under39View.topAnchor.constraint(equalTo: view.topAnchor, constant: 251).isActive = true
        under39View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        under39View.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    @objc private func dismissed() {
        dismiss(animated: true)
    }
}
