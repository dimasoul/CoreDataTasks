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
        var buttonConfiguration = UIButton.Configuration.filled() // закрашенная кнопка
        buttonConfiguration.baseBackgroundColor = UIColor(
            red: 21/255,
            green: 101/22,
            blue: 192/22,
            alpha: 194/255
        
        )
        
        var attributes = AttributeContainer()
        
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        buttonConfiguration.attributedTitle = AttributedString("Save Task", attributes: attributes)
        
        return UIButton(configuration: buttonConfiguration, primaryAction: UIAction { _ in
            self.dismiss(animated: true)
        })
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup(subviews: taskTextField, saveButton) //констрэйнты задаем после задания всех параметров
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
            // отступ сверху
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40), //отступ слево
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            // отступ справо
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ //установка констрэйнта
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
}
