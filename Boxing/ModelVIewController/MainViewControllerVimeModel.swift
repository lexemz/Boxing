//
//  MainViewControllerVimeModel.swift
//  Boxing
//
//  Created by Igor on 27.02.2022.
//

import Foundation

protocol MainViewControllerViewModelProtocol {
    var modelName: String { get }
    
    var textFieldText: Box<String?> { get }
    var buttonIsToggled: Box<Bool> { get }
    
    
    func buttonDidTapped()
    func textFieldDidChange(with string: String)
}

class MainViewControllerViewModel: MainViewControllerViewModelProtocol {
    var modelName: String {
        model.name
    }
    
    var textFieldText: Box<String?>
    var buttonIsToggled: Box<Bool>
    
    
    private var model: SomeModel
    
    init(_ model: SomeModel) {
        textFieldText = Box(model.textfieldData)
        buttonIsToggled = Box(UDManager.shared.getBoolData(key: "button"))
        
        self.model = model
    }
    
    func buttonDidTapped() {
        buttonIsToggled.value.toggle()
        
        // SET block in computed prop
        UDManager.shared.setData(status: buttonIsToggled.value, key: "button")
    }
    
    func textFieldDidChange(with string: String) {
        textFieldText.value = string
        
        // SET block in computed prop
        model.textfieldData = string
        dump(model)
        
        // save in DB or other actions...
    }
}
