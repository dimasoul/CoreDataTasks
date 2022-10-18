//
//  TaskViewController.swift
//  CoreDataTasks
//
//  Created by Дмитрий on 13.10.2022.
//

import UIKit

class TaskViewController: UIViewController {
    
    private lazy var taskTextField: UITextField = {  //отложенная инициализация переменной
        let textField = UITextField()
        
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        createButton(
            withTitle: "Save Task",
            andColor: UIColor(red: 21/255, green: 101/255, blue: 192/255, alpha: 194/255),
            action: UIAction { _ in
                self.dismiss(animated: true)
            })
    }()
    
    private lazy var cancelButton: UIButton = {
        createButton(
            withTitle: "Cancel",
            andColor: .systemRed,
            action: UIAction { _ in
                self.dismiss(animated: true)
            })
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup(subviews: taskTextField, saveButton, cancelButton) //констрэйнты задаем после задания всех параметров и добавления кнопок
        setConstrains()
    }
    
    private func setup(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstrains() {
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ //установка констрэйнта
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func createButton(withTitle title: String, andColor color: UIColor, action: UIAction) -> UIButton {
        var buttonConfiguration = UIButton.Configuration.filled() // закрашенная кнопка
        buttonConfiguration.baseBackgroundColor = color
        
        var attributes = AttributeContainer()
        
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attributes)
        
        return UIButton(configuration: buttonConfiguration, primaryAction: action)
    }
}
