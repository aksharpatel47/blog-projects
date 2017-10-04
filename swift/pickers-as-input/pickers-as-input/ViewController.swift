//
//  ViewController.swift
//  pickers-as-input
//
//  Created by Akshar Patel on 02/10/17.
//  Copyright © 2017 Akshar Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: Properties
  
  var datePicker: UIDatePicker {
    get {
      let datePicker = UIDatePicker()
      datePicker.date = Date()
      datePicker.datePickerMode = .date
      datePicker.addTarget(self, action: #selector(onDateChanged(sender:)), for: .valueChanged)
      datePicker.backgroundColor = UIColor.white
      return datePicker
    }
  }
  
  var pickerView: UIPickerView {
    get {
      let pickerView = UIPickerView()
      pickerView.dataSource = self
      pickerView.delegate = self
      pickerView.backgroundColor = UIColor.white
      return pickerView
    }
  }
  
  var pickerViewData = ["Hello", "World", "Beginning", "Swift"]
  
  var accessoryToolbar: UIToolbar {
    get {
      let accessoryToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
      let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDoneButtonTapped(sender:)))
      let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
      accessoryToolbar.items = [flexibleSpace, doneButton]
      accessoryToolbar.barTintColor = UIColor.white
      return accessoryToolbar
    }
  }
  
  // MARK: Outlets
  
  @IBOutlet weak var datePickerTextField: UITextField!
  @IBOutlet weak var pickerViewTextField: UITextField!
  
  // MARK: Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: Methods
  
  func setupUI() {
    datePickerTextField.inputView = datePicker
    datePickerTextField.inputAccessoryView = accessoryToolbar
    datePickerTextField.text = Date().mediumDateString
    
    pickerViewTextField.inputView = pickerView
    pickerViewTextField.inputAccessoryView = accessoryToolbar
    pickerViewTextField.text = pickerViewData[0]
  }
  
  @objc func onDateChanged(sender: UIDatePicker) {
    datePickerTextField.text = sender.date.mediumDateString
  }
  
  @objc func onDoneButtonTapped(sender: UIBarButtonItem) {
    if datePickerTextField.isFirstResponder {
      datePickerTextField.resignFirstResponder()
    }
    
    if pickerViewTextField.isFirstResponder {
      pickerViewTextField.resignFirstResponder()
    }
  }
}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerViewData.count
  }
}

// MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerViewData[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    pickerViewTextField.text = pickerViewData[row]
  }
}
