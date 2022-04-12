//
//  BookingFormViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 29/3/22.
//

import UIKit

class BookingFormViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textField.text = formatter.string(from: date)
        textField.textColor = .link
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height:250)
        textField.inputView = datePicker

        // Do any additional setup after loading the view.
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker)
    {
        // when date picker is changed, this function will be run
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textField.text = formatter.string(from: sender.date)
//        textField.textColor = .blue
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
