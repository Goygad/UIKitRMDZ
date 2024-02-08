// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ViewController: UIViewController {
    // MARK: - Constants

    let model = Model()
    let mainView = UIView()
    let startButton = UIButton()
    var enteredText = String()
    let enteredWordLabel = UILabel()
    let enteredWord = UILabel()
    let resultLabel = UILabel()
    let reversedEnteredWord = UILabel()

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createMainView()
        createStartButton()
        addConvertorAlert()

        // MARK: - Public Methods

        func createMainView() {
            mainView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            view.addSubview(mainView)
        }

        func createStartButton() {
            startButton.frame = CGRect(x: 30, y: view.center.y, width: 335, height: 44)
            startButton.backgroundColor = UIColor(
                red: 76 / 255.0,
                green: 216 / 255.0,
                blue: 102 / 255.0,
                alpha: 1
            )
            startButton.layer.cornerRadius = 12
            startButton.setTitle("Начать", for: .normal)
            startButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
            mainView.addSubview(startButton)
        }

        func addConvertorAlert() {
            startButton.addTarget(self, action: #selector(createConvertorAlert), for: .touchUpInside)
        }
    }

    func createLabelEnteredWord() {
        enteredWordLabel.frame = CGRect(x: 60, y: 100, width: 275, height: 57)
        enteredWordLabel.text = "Вы ввели слово"
        enteredWordLabel.font = .monospacedDigitSystemFont(ofSize: 16, weight: .heavy)
        enteredWordLabel.textAlignment = .center
        mainView.addSubview(enteredWordLabel)
    }

    func createEnteredWord() {
        enteredWord.frame = CGRect(x: 60, y: 160, width: 275, height: 57)
        enteredWord.text = "\(enteredText)"
        enteredWord.font = .monospacedDigitSystemFont(ofSize: 16, weight: .heavy)
        enteredWord.textAlignment = .center
        enteredWord.textColor = .systemGray4
        mainView.addSubview(enteredWord)
    }

    func createResultLabel() {
        resultLabel.frame = CGRect(x: 50, y: 280, width: 275, height: 57)
        resultLabel.text = "А вот что получится,\n если читать справа налево"
        resultLabel.numberOfLines = 0
        resultLabel.font = .monospacedDigitSystemFont(ofSize: 16, weight: .heavy)
        resultLabel.textAlignment = .center
        mainView.addSubview(resultLabel)
    }

    func createReversedWord() {
        reversedEnteredWord.frame = CGRect(x: 60, y: 340, width: 275, height: 57)
        reversedEnteredWord.font = .monospacedDigitSystemFont(ofSize: 16, weight: .heavy)
        reversedEnteredWord.textAlignment = .center
        reversedEnteredWord.textColor = .systemGray4
        mainView.addSubview(reversedEnteredWord)
    }

    func changePositionButton() {
        startButton.frame = CGRect(x: 30, y: 600, width: 335, height: 44)
    }

    @objc func createConvertorAlert() {
        let convertorAlert = UIAlertController(title: "Введите ваше слово", message: "", preferredStyle: .alert)
        convertorAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        convertorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.enteredText = convertorAlert.textFields?.first?.text ?? "Error"

            let reversedTxt = self.model.reversedText(text: self.enteredText)
            self.reversedEnteredWord.text = reversedTxt
            self.createLabelEnteredWord()
            self.changePositionButton()
            self.createResultLabel()
            self.createEnteredWord()
            self.createReversedWord()

        }))
        convertorAlert.addTextField()
        present(convertorAlert, animated: true)
    }
}
