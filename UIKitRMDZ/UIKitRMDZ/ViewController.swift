// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран с кнопками игр
final class MainViewController: UIViewController {
    // MARK: - Private Properties

    private let mainView = UIView()
    private let imageMainView = UIImageView(image: UIImage(named: "backgroundView"))
    private let guessNumberButton = UIButton()
    private let calculateButton = UIButton()
    private let greetingLabel = UILabel()
    private var sum = Int()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createMainView()
        setBackgroundMainView()
        createGuessNumberButton()
        createCalculateButton()
        createGreetingLable()
        addAlertCalculateButton()
        addAlertGuessButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        addPerformanceAlert()
    }

    // MARK: - Private Methods

    private func createMainView() {
        mainView.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(mainView)
    }

    private func setBackgroundMainView() {
        imageMainView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        mainView.addSubview(imageMainView)
    }

    private func createGuessNumberButton() {
        guessNumberButton.frame = CGRect(x: 100, y: 300, width: 150, height: 150)
        guessNumberButton.backgroundColor = UIColor(
            red: 155 / 255.0,
            green: 127 / 255.0,
            blue: 181 / 255.0,
            alpha: 1.0
        )
        guessNumberButton.layer.cornerRadius = 20
        guessNumberButton.layer.borderWidth = 3
        guessNumberButton.layer.borderColor = .init(
            red: 76 / 255.0,
            green: 36 / 255.0,
            blue: 115 / 255.0,
            alpha: 1.0
        )
        guessNumberButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        guessNumberButton.titleLabel?.numberOfLines = 0
        guessNumberButton.setTitle("Угадай\n число", for: .normal)
        mainView.addSubview(guessNumberButton)
    }

    private func createCalculateButton() {
        calculateButton.frame = CGRect(x: 150, y: 500, width: 200, height: 200)
        calculateButton.backgroundColor = UIColor(
            red: 100 / 255.0,
            green: 181 / 255.0,
            blue: 130 / 255.0,
            alpha: 1.0
        )
        calculateButton.layer.cornerRadius = 20
        calculateButton.layer.borderWidth = 3
        calculateButton.layer.borderColor = .init(
            red: 59 / 255.0,
            green: 105 / 255.0,
            blue: 76 / 255.0,
            alpha: 1.0
        )
        calculateButton.setTitle("Калькулятор", for: .normal)
        calculateButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        mainView.addSubview(calculateButton)
    }

    private func createGreetingLable() {
        greetingLabel.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 82)
        greetingLabel.text = "Приветствую,\n "
        greetingLabel.layer.borderWidth = 3
        greetingLabel.layer.borderColor = .init(
            red: 255 / 255.0,
            green: 255 / 255.0,
            blue: 255 / 255.0,
            alpha: 1
        )
        greetingLabel.backgroundColor = UIColor(
            red: 151 / 255.0,
            green: 203 / 255.0,
            blue: 229 / 255.0,
            alpha: 1.0
        )
        greetingLabel.textColor = .white
        greetingLabel.textAlignment = .center
        greetingLabel.numberOfLines = 0
        greetingLabel.font = .systemFont(ofSize: 30, weight: .bold)
    }

    private func addPerformanceAlert() {
        let performanceAlert = UIAlertController(
            title: "Пожалуйста, представтесь",
            message: "",
            preferredStyle: .alert
        )
        performanceAlert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { _ in
            self.mainView.addSubview(self.greetingLabel)
            let text = performanceAlert.textFields?.first
            self.greetingLabel.text! += (text?.text ?? "") + "!"
        }))
        performanceAlert.addTextField()
        performanceAlert.textFields?.first?.placeholder = "Введите ваше имя"
        present(performanceAlert, animated: true)
    }

    private func addAlertCalculateButton() {
        calculateButton.addTarget(self, action: #selector(createAlertCalculateButton), for: .touchUpInside)
    }

    private func addAlertGuessButton() {
        guessNumberButton.addTarget(self, action: #selector(createAlertGuessButton), for: .touchUpInside)
    }

    private func addAlertBiggerNumberResultOfGuess() {
        let resultGuess = UIAlertController(
            title: "Попробуйте еще раз!",
            message: "Вы ввели слишком большое число!",
            preferredStyle: .alert
        )
        resultGuess.addAction(UIAlertAction(title: "OK", style: .cancel))
        resultGuess.addTextField()
        present(resultGuess, animated: true)
    }

    private func addSmallerNumberResultOfGuess() {
        let wrongResultGuess = UIAlertController(
            title: "Попробуйте еще раз!",
            message: "Вы ввели слишком маленькое число",
            preferredStyle: .alert
        )
        wrongResultGuess.addAction(UIAlertAction(title: "OK", style: .cancel))
        wrongResultGuess.addTextField()
        present(wrongResultGuess, animated: true)
    }

    private func addResultSumInAlert() {
        let resultSum = UIAlertController(title: "Ваш результат", message: "Результат: \(sum)", preferredStyle: .alert)
        resultSum.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(resultSum, animated: true)
    }

    private func addResultOfGuess() {
        let resultGuess = UIAlertController(title: "Вы угадали!", message: "Поздравляем!", preferredStyle: .alert)
        resultGuess.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(resultGuess, animated: true)
    }

    @objc private func createAlertCalculateButton() {
        let alertView = UIAlertController(title: "Введите ваши числа", message: "", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertView.addAction(UIAlertAction(title: "Сложить", style: .default) { _ in
            let numberOne = alertView.textFields?.first?.text
            let numberTwo = alertView.textFields?.last?.text
            let num1 = Int(numberOne ?? "")
            let num2 = Int(numberTwo ?? "")
            self.sum = (num1 ?? 0) + (num2 ?? 0)
            self.addResultSumInAlert()
        })
        alertView.addTextField()
        alertView.addTextField()
        present(alertView, animated: true)
    }

    @objc private func createAlertGuessButton() {
        let alertGuess = UIAlertController(title: "Угадай число от 1 до 10", message: "", preferredStyle: .alert)
        alertGuess.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertGuess.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in

            let firstTextField = alertGuess.textFields?.first?.text
            if firstTextField ?? "" > String(6) {
                self.addAlertBiggerNumberResultOfGuess()
            } else if firstTextField ?? "" < String(6) {
                self.addSmallerNumberResultOfGuess()
            } else {
                self.addResultOfGuess()
            }
        }))
        alertGuess.addTextField()
        present(alertGuess, animated: true)
    }
}
