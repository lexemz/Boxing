//
//  Box.swift
//  Boxing
//
//  Created by Igor on 01.03.2022.
//

class Box<T> {
    typealias Callback = (T) -> Void
    
    var value: T {
        didSet {
            callback?(value)
        }
    }
    
    var callback: Callback?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(callback: @escaping Callback) {
        self.callback = callback
        callback(value)
    }
}
