// MainMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class MainMenuViewController: UIViewController {
    // MARK: - Constants

    private enum Constant {
        static let new = "Новинки"
        static let sale = "Распродажа"
        static let brands = "Бренды"
        static let shoes = "Обувь"
        static let bags = "Сумки"
    }

    // MARK: - Private properties

    // MARK: - Visual

    private lazy var segmentControl: UISegmentedControl = {
        var segmentControl = UISegmentedControl()
        let buyers = ["Женщинам", "Мужчинам", "Детям"]
        segmentControl = UISegmentedControl(items: buyers)

        segmentControl.addTarget(self, action: #selector(changeBuyers), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 1
        return segmentControl
    }()

    private let newImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.image = .manShoesMainBlack
        image.layer.shadowRadius = 2
        image.layer.shadowColor = UIColor.gray.cgColor
        image.layer.shadowOpacity = 1
        image.layer.shadowOffset = CGSize(width: 0, height: 4)
        return image
    }()

    private let newLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.new
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textAlignment = .center
        return label
    }()

    private let saleImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.image = .manShoesMainBrown
        image.layer.shadowRadius = 2
        image.layer.shadowColor = UIColor.gray.cgColor
        image.layer.shadowOpacity = 1
        image.layer.shadowOffset = CGSize(width: 0, height: 4)
        return image
    }()

    private let saleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.sale
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textAlignment = .center
        return label
    }()

    private let brandsView: UIView = {
        let view = UIView()
        view.backgroundColor = .backView
        view.layer.cornerRadius = 12
        return view
    }()

    private let brandsLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.brands
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textAlignment = .left
        return label
    }()

    private let brandsImageView: UIImageView = {
        let image = UIImageView()
        image.image = .brends
        return image
    }()

    private lazy var shoesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backView
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(pushToCatalogue), for: .touchUpInside)
        return button
    }()

    private let shoesLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.shoes
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textAlignment = .left
        return label
    }()

    private let shoesImageView: UIImageView = {
        let image = UIImageView()
        image.image = .shoesManBrown
        return image
    }()

    private let bagsView: UIView = {
        let view = UIView()
        view.backgroundColor = .backView
        view.layer.cornerRadius = 12

        return view
    }()

    private let bagsLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.bags
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textAlignment = .left
        return label
    }()

    private let bagsImageView: UIImageView = {
        let image = UIImageView()
        image.image = .bagMan
        return image
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }

    // MARK: - Private methods

    private func setupViewController() {
        view.backgroundColor = .white
        view.addSubview(segmentControl)
        view.addSubview(newImageView)
        view.addSubview(saleImageView)
        view.addSubview(brandsView)
        view.addSubview(shoesButton)
        view.addSubview(bagsView)
        newImageView.addSubview(newLabel)
        saleImageView.addSubview(saleLabel)
        brandsView.addSubview(brandsLabel)
        shoesButton.addSubview(shoesLabel)
        bagsView.addSubview(bagsLabel)
        brandsView.addSubview(brandsImageView)
        shoesButton.addSubview(shoesImageView)
        bagsView.addSubview(bagsImageView)
        makeNewManConstraints()
        makeSaleManConstraints()
        makeBrandsViewConstraints()
        makeShoesButtonConstraints()
        makeBagsButtonConstraints()
        makeNewLabelConstraints()
        makeSaleLabelConstraints()
        makeBrandsLabelConstraints()
        makeShoesLabelConstraints()
        makeBagsLabelConstraints()
        makeBrandsImageConstraints()
        makeShoesImageConstraints()
        makeBagsImageConstraints()
        makeSegmentControl()
    }

    private func makeSegmentControl() {
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
            .isActive = true
        segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 122).isActive = true
        segmentControl.widthAnchor.constraint(equalToConstant: 345).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private func makeNewManConstraints() {
        newImageView.translatesAutoresizingMaskIntoConstraints = false
        newImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        newImageView.trailingAnchor.constraint(equalTo: saleImageView.leadingAnchor, constant: -15)
            .isActive = true
        newImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -506).isActive = true
        newImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        newImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        newImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }

    private func makeSaleManConstraints() {
        saleImageView.translatesAutoresizingMaskIntoConstraints = false
        saleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        saleImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -506).isActive = true
        saleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        saleImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        saleImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }

    private func makeBrandsViewConstraints() {
        brandsView.translatesAutoresizingMaskIntoConstraints = false
        brandsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        brandsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        brandsView.topAnchor.constraint(equalTo: newImageView.bottomAnchor, constant: 20).isActive = true
        brandsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -406).isActive = true
        brandsView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        brandsView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func makeShoesButtonConstraints() {
        shoesButton.translatesAutoresizingMaskIntoConstraints = false
        shoesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        shoesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        shoesButton.topAnchor.constraint(equalTo: brandsView.bottomAnchor, constant: 20).isActive = true
        shoesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -306).isActive = true
        shoesButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        shoesButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func makeBagsButtonConstraints() {
        bagsView.translatesAutoresizingMaskIntoConstraints = false
        bagsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bagsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        bagsView.topAnchor.constraint(equalTo: shoesButton.bottomAnchor, constant: 20).isActive = true
        bagsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -206).isActive = true
        bagsView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        bagsView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func makeNewLabelConstraints() {
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        newLabel.leadingAnchor.constraint(equalTo: newImageView.leadingAnchor, constant: 2).isActive = true
        newLabel.trailingAnchor.constraint(equalTo: newImageView.trailingAnchor, constant: -2).isActive = true
        newLabel.bottomAnchor.constraint(equalTo: newImageView.bottomAnchor, constant: -103).isActive = true
        newLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        newLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeSaleLabelConstraints() {
        saleLabel.translatesAutoresizingMaskIntoConstraints = false
        saleLabel.leadingAnchor.constraint(equalTo: saleImageView.leadingAnchor, constant: 2).isActive = true
        saleLabel.trailingAnchor.constraint(equalTo: saleImageView.trailingAnchor, constant: -2).isActive = true
        saleLabel.topAnchor.constraint(equalTo: saleImageView.topAnchor, constant: 103).isActive = true
        saleLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        saleLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeBrandsLabelConstraints() {
        brandsLabel.translatesAutoresizingMaskIntoConstraints = false
        brandsLabel.leadingAnchor.constraint(equalTo: brandsView.leadingAnchor, constant: 20).isActive = true
        brandsLabel.trailingAnchor.constraint(equalTo: brandsView.trailingAnchor, constant: -215).isActive = true
        brandsLabel.topAnchor.constraint(equalTo: brandsView.topAnchor, constant: 31).isActive = true
        brandsLabel.bottomAnchor.constraint(equalTo: brandsView.bottomAnchor, constant: -32).isActive = true
        brandsLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        brandsLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeShoesLabelConstraints() {
        shoesLabel.translatesAutoresizingMaskIntoConstraints = false
        shoesLabel.leadingAnchor.constraint(equalTo: shoesButton.leadingAnchor, constant: 20).isActive = true
        shoesLabel.trailingAnchor.constraint(equalTo: shoesButton.trailingAnchor, constant: -215).isActive = true
        shoesLabel.topAnchor.constraint(equalTo: shoesButton.topAnchor, constant: 31).isActive = true
        shoesLabel.bottomAnchor.constraint(equalTo: shoesButton.bottomAnchor, constant: -32).isActive = true
        shoesLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoesLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeBagsLabelConstraints() {
        bagsLabel.translatesAutoresizingMaskIntoConstraints = false
        bagsLabel.leadingAnchor.constraint(equalTo: bagsView.leadingAnchor, constant: 20).isActive = true
        bagsLabel.trailingAnchor.constraint(equalTo: bagsView.trailingAnchor, constant: -215).isActive = true
        bagsLabel.topAnchor.constraint(equalTo: bagsView.topAnchor, constant: 31).isActive = true
        bagsLabel.bottomAnchor.constraint(equalTo: bagsView.bottomAnchor, constant: -32).isActive = true
        bagsLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        bagsLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeBrandsImageConstraints() {
        brandsImageView.translatesAutoresizingMaskIntoConstraints = false
        brandsImageView.leadingAnchor.constraint(equalTo: bagsView.leadingAnchor, constant: 236).isActive = true
    }

    private func makeShoesImageConstraints() {
        shoesImageView.translatesAutoresizingMaskIntoConstraints = false
        shoesImageView.leadingAnchor.constraint(equalTo: shoesButton.leadingAnchor, constant: 236).isActive = true
    }

    private func makeBagsImageConstraints() {
        bagsImageView.translatesAutoresizingMaskIntoConstraints = false
        bagsImageView.leadingAnchor.constraint(equalTo: bagsView.leadingAnchor, constant: 236).isActive = true
    }

    @objc private func changeBuyers(_ segmentControl: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            newImageView.image = .womShoesMain
            saleImageView.image = .womShoesMainLight
            shoesImageView.image = .womShoesWhite
            bagsImageView.image = .womBag
        case 1:
            newImageView.image = .manShoesMainBlack
            saleImageView.image = .manShoesMainBrown
            shoesImageView.image = .shoesManBrown
            bagsImageView.image = .bagMan
        case 2:
            newImageView.image = .childShoesMainBlue
            saleImageView.image = .childShoesMainRed
            shoesImageView.image = .childShoes
            bagsImageView.image = .childBag
        default: break
        }
    }

    @objc private func pushToCatalogue() {
        let catalogueViewController = CatalogueViewController()
        navigationController?.pushViewController(catalogueViewController, animated: true)
    }
}
