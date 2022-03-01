//
//  MainViewControllerVimeModel.swift
//  Boxing
//
//  Created by Igor on 27.02.2022.
//

import Foundation

protocol MainViewControllerViewModelProtocol {
    var modelName: String { get }
    var textFieldText: String? { get }
    var buttonIsToggled: Bool { get }
    
    var viewModelDidChange: ((MainViewControllerViewModelProtocol) -> Void)? { get set }
    
    func buttonDidTapped()
    func textFieldDidChange(with string: String)
}

class MainViewControllerViewModel: MainViewControllerViewModelProtocol {
    var modelName: String {
        model.name
    }
    
    var textFieldText: String? {
        get {
            model.textfieldData
        }
        set {
            model.textfieldData = newValue ?? ""
            dump(model)
            
            // save in DB or other actions...
            
            viewModelDidChange?(self)
        }
    }
    
    var buttonIsToggled: Bool {
        get {
            UDManager.shared.getBoolData(key: "button")
        } set {
            UDManager.shared.setData(status: newValue, key: "button")
            viewModelDidChange?(self)
        }
    }
    
    var viewModelDidChange: ((MainViewControllerViewModelProtocol) -> Void)?
    
    private var model: SomeModel
    
    init(_ model: SomeModel) {
        self.model = model
    }
    
    func buttonDidTapped() {
        buttonIsToggled.toggle()
    }
    
    func textFieldDidChange(with string: String) {
        textFieldText = string
    }
}
