// UserInfoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let name = "Имя"
    static let surname = "Фамилия"
    static let phoneNumber = "Номер телефона"
    static let fontVerdana = "Verdana-Bold"
    static let birthday = "Дата рождения"
    static let email = "Почта"
    static let save = "Сохранить"
    static let sizeLeg = "Размер ноги"
    static let cancel = "Cancel"
    static let done = "Done"
}

protocol UserInfoViewControllerDelegate: AnyObject {
    func tapSaveButton(model: UserInfoModel)
}

///
final class UserInfoViewController: UIViewController {
    weak var delegate: UserInfoViewControllerDelegate?

    // MARK: - Private Properties

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.name
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.surname
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.phoneNumber
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var sizeLegTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.sizeLeg
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.birthday
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.email
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(valueChanged(sender:)), for: .editingChanged)
        return textField
    }()

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.save, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontVerdana, size: 16)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 12
        button.isHidden = true
        button.backgroundColor = #colorLiteral(red: 0.8623434901, green: 0.09765904397, blue: 0.569730103, alpha: 1)
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        showDatePicker()
    }

    // MARK: - Public Methods

    func configure(model: UserInfoModel) {
        nameTextField.text = model.name
        surnameTextField.text = model.surname
        if let phone = model.phone {
            phoneNumberTextField.text = "\(phone)"
        }
        if let legSize = model.sizeLeg {
            sizeLegTextField.text = "\(legSize)"
        }
        if let birthday = model.birthday {
            birthdayTextField.text = "\(birthday)"
        }
        if let email = model.email {
            emailTextField.text = email
        }
    }

    // MARK: - Private Methods

    @objc private func valueChanged(sender: UITextField) {
        if let text = sender.text {
            text.isEmpty ? (saveButton.isHidden = true) : (saveButton.isHidden = false)
        }
    }

    @objc private func saveButtonPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateF = dateFormatter.date(from: birthdayTextField.text ?? "")
        delegate?.tapSaveButton(
            model: UserInfoModel(
                name: nameTextField.text ?? "",
                surname: surnameTextField.text ?? "",
                phone: Int(phoneNumberTextField.text ?? ""),
                sizeLeg: Int(sizeLegTextField.text ?? ""),
                birthday: dateF,
                email: emailTextField.text
            )
        )
        navigationController?.popViewController(animated: true)
    }

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(sizeLegTextField)
        view.addSubview(birthdayTextField)
        view.addSubview(emailTextField)
        view.addSubview(saveButton)
    }

    private func showDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(showDate(datePicker:)), for: .valueChanged)
        birthdayTextField.inputView = datePicker
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 40.0))
        let cancel = UIBarButtonItem(title: Constant.cancel, style: .plain, target: self, action: #selector(cancelPressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: Constant.done, style: .plain, target: self, action: #selector(donePressed))
        toolBar.setItems([cancel, flexibleSpace, done], animated: false)
        birthdayTextField.inputAccessoryView = toolBar
    }

    private func setupConstraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        sizeLegTextField.translatesAutoresizingMaskIntoConstraints = false
        birthdayTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),

            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            surnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            surnameTextField.heightAnchor.constraint(equalToConstant: 44),

            phoneNumberTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 44),

            sizeLegTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            sizeLegTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sizeLegTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sizeLegTextField.heightAnchor.constraint(equalToConstant: 44),

            birthdayTextField.topAnchor.constraint(equalTo: sizeLegTextField.bottomAnchor, constant: 20),
            birthdayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 44),

            emailTextField.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),

            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func showDate(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        birthdayTextField.text = dateFormatter.string(from: datePicker.date)
    }

    @objc private func cancelPressed() {
        dismiss(animated: true)
    }

    @objc private func donePressed() {
        view.endEditing(true)
    }
}
