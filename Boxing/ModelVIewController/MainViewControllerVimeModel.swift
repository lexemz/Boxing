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
    
//    var viewModelDidChange: ((MainViewControllerViewModelProtocol) -> Void)? { get set }
    
    func buttonDidTapped()
    func textFieldDidChange(with string: String)
}

class MainViewControllerViewModel: MainViewControllerViewModelProtocol {
    var modelName: String {
        model.name
    }
    
//    var textFieldText: String? {
//        get {
//            model.textfieldData
//        }
//        set {
//            model.textfieldData = newValue ?? ""
//            dump(model)
//
//            // save in DB or other actions...
//        }
//    }
    var textFieldText: Box<String?>
    
//    var buttonIsToggled: Bool {
//        get {
//            UDManager.shared.getBoolData(key: "button")
//        } set {
//            UDManager.shared.setData(status: newValue, key: "button")
//            viewModelDidChange?(self)
//        }
//    }
    var buttonIsToggled: Box<Bool>
    
//    var viewModelDidChange: ((MainViewControllerViewModelProtocol) -> Void)?
    
    private var model: SomeModel
    
    init(_ model: SomeModel) {
        // GET block in computed prop
        textFieldText = Box(model.textfieldData)
        buttonIsToggled = Box(UDManager.shared.getBoolData(key: "button"))
        // ---
        
        self.model = model
    }
    
    func buttonDidTapped() {
        buttonIsToggled.value.toggle()
        
        // SET block in computed prop
        UDManager.shared.setData(status: buttonIsToggled.value, key: "button")
        // ---
    }
    
    func textFieldDidChange(with string: String) {
        textFieldText.value = string
        
        // SET block in computed prop
        model.textfieldData = string
        dump(model)
        
        // save in DB or other actions...
        // ---
    }
}
