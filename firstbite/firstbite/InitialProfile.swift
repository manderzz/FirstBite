//
//  InitialProfile.swift
//  firstbite
//
//  Created by Kelvin Lee on 2018-07-18.
//  Copyright © 2018 Healthy7. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

var userDocumentName = "test-user"

class InitialProfile: UIViewController {
    
    var firestore: Firestore!
    
    //Creating variables
    var UserName = ""
    var UserChildName = ""
    var ChildBirthYear = 0
    var ChildBirthMonth = 0
    var ChildBirthDate = 0
    var ChildGender = ""
    var ChildHeight = 0.0
    var ChildWeight = 0.0
    
    //Input User Name
    @IBOutlet weak var userNameInput: UITextField!
    
    //Input User Child Name
    @IBOutlet weak var userChildNameInput: UITextField!
    
    //Input User Child Birthday
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //Input User Child Gender as Boy
    @IBAction func selectBoy(_ sender: Any) {
        ChildGender = "Boy"
    }
    
    //Input User Child Gender as Girl
    @IBAction func selectGirl(_ sender: Any) {
        ChildGender = "Girl"
    }
    
    //Input User Child Height
    @IBOutlet weak var userChildHeightInput: UITextField!
    
    //Input User Child Weight
    @IBOutlet weak var userChildWeightInput: UITextField!
    
    //Submit
    @IBAction func submit(_ sender: Any) {
        UserName = userNameInput.text!
        
        UserChildName = userChildNameInput.text!
        
        let date = Date()
        let ccalendar = Calendar.current
        let year = ccalendar.component(.year, from: date)
        let month = ccalendar.component(.month, from: date)
        var age: Int
        let calendar = Calendar.current
        ChildBirthYear = calendar.component(.year, from: datePicker.date)
        ChildBirthMonth = calendar.component(.month, from: datePicker.date)
        ChildBirthDate = calendar.component(.day, from: datePicker.date)
        if month >= ChildBirthMonth {
            age = 12 * (year - ChildBirthYear) + (month - ChildBirthMonth)
        }
        else {
            age = 12 * (year - ChildBirthYear) + (ChildBirthMonth - month)
        }
        
        if userChildHeightInput.text != "" {
            ChildHeight = Double(userChildHeightInput.text!)!
        }
        else {
            ChildHeight = 0
        }
        var HeightTrendCount: Int
        if ChildHeight == 0 {
            HeightTrendCount = 0
        }
        else {
            HeightTrendCount = 1
        }
        
        if userChildWeightInput.text != "" {
            ChildWeight = Double(userChildWeightInput.text!)!
        }
        else {
            ChildWeight = 0
        }
        var WeightTrendCount: Int
        if ChildWeight == 0 {
            WeightTrendCount = 0
        }
        else {
            WeightTrendCount = 1
        }
        
        userDocumentName = UserName + UserChildName + String(ChildBirthYear) + String(ChildBirthMonth) + String(ChildBirthDate)
        
        firestore = Firestore.firestore()
        firestore.collection(Auth.auth().currentUser!.uid).document(userDocumentName).setData(["AgeTrendCount": 1, "Age_trend0": age, "Age_trend1": -1, "Age_trend2": -1, "Age_trend3": -1, "Age_trend4": -1, "Child_birthday": ChildBirthDate, "Child_birthmonth": ChildBirthMonth, "Child_birthyear": ChildBirthYear, "Child_gender": ChildGender, "Child_height": ChildHeight, "Child_name": UserChildName, "Child_weight": ChildWeight, "HeightTrendCount": HeightTrendCount, "Height_trend0": ChildHeight, "Height_trend1": 0, "Height_trend2": 0, "Height_trend3": 0, "Height_trend4": 0, "User_name": UserName, "WeightTrendCount": WeightTrendCount, "Weight_trend0": ChildWeight, "Weight_trend1": 0, "Weight_trend2": 0, "Weight_trend3": 0, "Weight_trend4": 0
            ])
        print(userDocumentName)
    }
    
    //Separation Line
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}