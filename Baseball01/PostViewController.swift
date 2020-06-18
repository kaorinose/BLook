//
//  PostViewController.swift
//  Baseball01
//
//  Created by 0003 QBS on 2020/06/02.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var companionTextField: UITextField!
    @IBOutlet weak var seatTextField: UITextField!
    @IBOutlet weak var winTeamTextField: UITextField!
    @IBOutlet weak var winCountTextField: UITextField!
    @IBOutlet weak var loseTeamTextField: UITextField!
    @IBOutlet weak var loseCountTextField: UITextField!
    
    let realm = try! Realm()
    var event: Event!
    
    // 戻るボタンをタップしたときに呼ばれるメソッド
    @IBAction func returnButton(_ sender: Any) {
        // ホーム画面に戻る
        self.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)

        datePicker.date = event.date
        placeTextField.text = event.place
        companionTextField.text = event.companion
        seatTextField.text = event.seat
        winTeamTextField.text = event.winTeam
        winCountTextField.text = event.winCount
        loseTeamTextField.text = event.loseTeam
        loseCountTextField.text = event.loseCount
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            
            self.event.date = self.datePicker.date
            self.event.place = self.placeTextField.text!
            self.event.companion = self.companionTextField.text!
            self.event.seat = self.seatTextField.text!
            self.event.winTeam = self.winTeamTextField.text!
            self.event.winCount = self.winCountTextField.text!
            self.event.loseTeam = self.loseTeamTextField.text!
            self.event.loseCount = self.loseCountTextField.text!
            self.realm.add(self.event, update: .modified)
        }

        super.viewWillDisappear(animated)
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
}
