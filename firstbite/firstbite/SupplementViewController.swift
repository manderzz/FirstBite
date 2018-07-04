//
//  SupplementViewController.swift
//  homework3
//
//  Created by Healthy 7 Group on 2018-07-02.
//  Copyright © 2018 Healthy 7 Group. All rights reserved.
//

import UIKit

class SupplementViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // pickers
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    @IBOutlet weak var quantityPickerOutlet: UIPickerView!
    
    // text fields
    @IBOutlet weak var foodTextFieldOutlet: UITextField!
    @IBOutlet weak var quantityTextFieldOutlet: UITextField!
    
    let categoryArray:[String] = ["", "Cereal", "Finger Foods", "Fruit", "Juice", "Meat", "Veggies", "Vitamins"]
    let unitsArray:[String] = ["", "g", "mL", "oz"]
    
    var foodNameString: String = ""
    var categoryTypeString: String = ""
    var quantityString: String = ""
    var quantityUnitString: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 1){
            return categoryArray.count
        }
        else{
            return unitsArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 1){
            return categoryArray[row]
        }
        else{
            return unitsArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 1){
            categoryTypeString = categoryArray[row]
        }
        else{
            quantityUnitString = unitsArray[row]
        }
    }
    
    @objc func saveData() {
//        let date:Date = datePickerOutlet.date
//        let formatter:DateFormatter = DateFormatter()
//        formatter.dateFormat = "MMM dd, h:mm a"
//        let dateTimeTemp = formatter.string(from: date)
//        let tempResult = "Other: " + dateTimeTemp + " " + foodTextFieldOutlet.text! + " " + quantityTextFieldOutlet.text! + " " + segmentOutlet.titleForSegment(at: segmentOutlet.selectedSegmentIndex)!
//        if var data:[String] = UserDefaults.standard.value(forKey: "breastfeed") as? [String] {
//            data.insert(tempResult, at: 0)
//            UserDefaults.standard.set(data, forKey: "breastfeed")
//        } else {
//            var data:[String] = []
//            data.insert(tempResult, at: 0)
//            UserDefaults.standard.set(data, forKey: "breastfeed")
//        }
//        showAlert()
    }
    
    func showAlert() {
        let alert:UIAlertController = UIAlertController(title: "Saved Successfully", message: "You can continue adding data here. \nPlease go to Log tab to view saved data", preferredStyle: .alert)
        let action1: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) {
            (_:UIAlertAction) in
            print("cancel handler")
        }
        alert.addAction(action1)
        self.present(alert,animated:true) {
            print("alert handler")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
