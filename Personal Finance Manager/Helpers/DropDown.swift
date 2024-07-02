//
//  DropDown.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/2/24.
//

import UIKit

extension UIViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setupDropdown(button: UIButton, textField: UITextField, options: [String], pickerViewTag: Int) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = pickerViewTag
        
        objc_setAssociatedObject(textField, &dropdownOptionsKey, options, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        textField.inputView = pickerView
        button.addTarget(self, action: #selector(showPickerView), for: .touchUpInside)
        textField.text = options.first
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPickerView))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func showPickerView(_ sender: UIButton) {
        if sender.tag == 1000, let textField = view.viewWithTag(1002) as? UITextField {
            textField.becomeFirstResponder()
        } else if sender.tag == 1001, let textField = view.viewWithTag(1003) as? UITextField {
            textField.becomeFirstResponder()
        }
    }
    
    @objc func dismissPickerView() {
        if let textField = view.viewWithTag(1002) as? UITextField {
            textField.resignFirstResponder()
        } else if let textField = view.viewWithTag(1003) as? UITextField {
            textField.resignFirstResponder()
        }
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1001, let textField = view.viewWithTag(1002) as? UITextField,
           let options = objc_getAssociatedObject(textField, &dropdownOptionsKey) as? [String] {
            return options.count
        } else if pickerView.tag == 1002, let textField = view.viewWithTag(1003) as? UITextField,
                  let options = objc_getAssociatedObject(textField, &dropdownOptionsKey) as? [String] {
            return options.count
        }
        return 0
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1001, let textField = view.viewWithTag(1002) as? UITextField,
           let options = objc_getAssociatedObject(textField, &dropdownOptionsKey) as? [String] {
            return options[row]
        } else if pickerView.tag == 1002, let textField = view.viewWithTag(1003) as? UITextField,
                  let options = objc_getAssociatedObject(textField, &dropdownOptionsKey) as? [String] {
            return options[row]
        }
        return nil
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1001, let textField = view.viewWithTag(1002) as? UITextField,
           let options = objc_getAssociatedObject(textField, &dropdownOptionsKey) as? [String] {
            textField.text = options[row]
            textField.resignFirstResponder()
        } else if pickerView.tag == 1002, let textField = view.viewWithTag(1003) as? UITextField,
                  let options = objc_getAssociatedObject(textField, &dropdownOptionsKey) as? [String] {
            textField.text = options[row]
            textField.resignFirstResponder()
        }
    }
}

private var dropdownOptionsKey: UInt8 = 0
