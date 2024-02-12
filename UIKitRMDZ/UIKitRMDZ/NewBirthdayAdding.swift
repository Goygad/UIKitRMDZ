// NewBirthdayAdding.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран добавления нового ДР
final class NewBirthdayAdding: UIViewController {
    // MARK: - Private Properties

    let genders = ["Male", "Female"]
    let ages = Array(1 ... 100)

    // MARK: - Private Properties

    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 20, width: 50, height: 20)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(addCancelButton), for: .touchUpInside)
        return button
    }()

    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 330, y: 20, width: 50, height: 20)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Add", for: .normal)
        return button
    }()

    private let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "person")
        imageView.frame = CGRect(x: 130, y: 66, width: 125, height: 125)
        return imageView
    }()

    private let changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change photo", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 130, y: 199, width: 125, height: 20)
        return button
    }()

    private let nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.frame = CGRect(x: 20, y: 239, width: 175, height: 19)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Name Surname")
        textField.frame = CGRect(x: 20, y: 268, width: 175, height: 17)
        return textField
    }()

    private let nameUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 293, width: 345, height: 1)
        return view
    }()

    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday"
        label.frame = CGRect(x: 20, y: 314, width: 175, height: 19)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Date of Birth")
        textField.frame = CGRect(x: 20, y: 343, width: 175, height: 17)
        return textField
    }()

    private let birthdayUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 368, width: 345, height: 1)
        return view
    }()

    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.frame = CGRect(x: 20, y: 389, width: 175, height: 19)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing age")
        textField.frame = CGRect(x: 20, y: 418, width: 175, height: 17)
        return textField
    }()

    private let ageUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 443, width: 345, height: 1)
        return view
    }()

    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.frame = CGRect(x: 20, y: 462, width: 175, height: 19)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Indicate Gender")
        textField.frame = CGRect(x: 20, y: 491, width: 175, height: 17)
        return textField
    }()

    private let genderUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 516, width: 345, height: 1)
        return view
    }()

    private let telegramLabel: UILabel = {
        let label = UILabel()
        label.text = "Telegram"
        label.frame = CGRect(x: 20, y: 537, width: 175, height: 19)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private lazy var telegramTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Telegram")
        textField.frame = CGRect(x: 20, y: 566, width: 175, height: 17)
        textField.addTarget(self, action: #selector(addAlertTelegram), for: .editingDidBegin)
        return textField
    }()

    private let telegramUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 591, width: 345, height: 1)
        return view
    }()

    private let datePickerView: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
        return datePicker
    }()

//
    private var agePickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    private var genderPickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addUI()
        signingProtocols()
        createDoneToolBarButton()
        setDatePicker()
    }

    // MARK: - Private Methods

    private func setView() {
        view.backgroundColor = .white
    }

    private func setDatePicker() {
        birthdayTextField.inputView = datePickerView
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }

    private func createDoneToolBarButton() {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(systemItem: .flexibleSpace)
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(clickDoneButton)
        )
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.tintColor = .systemBlue
        toolBar.sizeToFit()
        birthdayTextField.inputAccessoryView = toolBar
        ageTextField.inputAccessoryView = toolBar
        genderTextField.inputAccessoryView = toolBar
    }

    private func signingProtocols() {
        agePickerView.delegate = self
        agePickerView.dataSource = self
        ageTextField.inputView = agePickerView
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderTextField.inputView = genderPickerView
    }

    private func addUI() {
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(personImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(nameSurnameLabel)
        view.addSubview(nameTextField)
        view.addSubview(nameUnderView)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayTextField)
        view.addSubview(birthdayUnderView)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(ageUnderView)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(genderUnderView)
        view.addSubview(telegramLabel)
        view.addSubview(telegramTextField)
        view.addSubview(telegramUnderView)
    }

    @objc private func addAlertTelegram() {
        let alertController = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            if (self.telegramTextField.text?.isEmpty) != nil {
                self.telegramTextField.text = alertController.textFields?.first?.text
            }
        })
        alertController.addTextField()
        present(alertController, animated: true, completion: nil)
    }

    @objc private func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        birthdayTextField.text = dateFormatter.string(from: sender.date)
    }

    @objc private func addCancelButton() {
        dismiss(animated: true)
    }

    @objc private func clickDoneButton() {
        view.endEditing(true)
    }
}

// MARK: - Extension UIPickerViewDataSource

extension NewBirthdayAdding: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case agePickerView:
            return 100
        case genderPickerView:
            return 2
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case agePickerView:
            return String(ages[row])
        case genderPickerView:
            return genders[row]
        default:
            return "0"
        }
    }
}

// MARK: - Extension UIPickerViewDelegate

extension NewBirthdayAdding: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case agePickerView:
            ageTextField.text = String(ages[row])
        case genderPickerView:
            genderTextField.text = genders[row]
        default:
            break
        }
    }
}
