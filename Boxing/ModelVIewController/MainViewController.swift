//
//  ViewController.swift
//  Boxing
//
//  Created by Igor on 27.02.2022.
//

import UIKit

struct SomeModel {
    let name: String
    var textfieldData: String
}

class MainViewController: UIViewController {

    @IBOutlet var userTextField: UITextField!
    @IBOutlet var userButton: UIButton!
    
    private var viewModel: MainViewControllerViewModelProtocol! {
        didSet {
            viewModel.viewModelDidChange = { [weak self] viewModel in
                self?.setupTF(viewModel.textFieldText)
                self?.setupButton(viewModel.buttonIsToggled)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = SomeModel(name: "Model Name", textfieldData: "textfield string")
        
        viewModel = MainViewControllerViewModel(model)
        setupUI()
    }
    
    @IBAction func buttonIsPressed() {
        viewModel.buttonDidTapped()
    }
    
    private func setupUI() {
        setupTF(viewModel.textFieldText)
        setupButton(viewModel.buttonIsToggled)
        
        title = viewModel.modelName
    }
    
    private func setupTF(_ data: String?) {
        userTextField.text = data
    }
    
    private func setupButton(_ data: Bool?) {
        userButton.setTitle(String(data ?? false), for: .normal)
    }
}

extension MainViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        viewModel.textFieldDidChange(with: userTextField.text ?? "")
    }
}
