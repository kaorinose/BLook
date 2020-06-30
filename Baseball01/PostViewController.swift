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
    var dateString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)

        print("DEBUG PostViewController event: \(event)")
        
        //datePicker.date = event.date
        //placeTextField.text = event.place
        //companionTextField.text = event.companion
        //seatTextField.text = event.seat
        //winTeamTextField.text = event.winTeam
        //winCountTextField.text = event.winCount
        //loseTeamTextField.text = event.loseTeam
        //loseCountTextField.text = event.loseCount
    }
    
    // 戻るボタンをタップしたときに呼ばれるメソッド
    @IBAction func returnButton(_ sender: Any) {
        // ホーム画面に戻る
        self.dismiss(animated: true, completion: nil)
    }

    // 保存ボタンをタップしたときに呼ばれるメソッド
    @IBAction func saveButton(_ sender: Any) {
        // DB書き込み処理
        print("DEBUG PostViewController 1：データ書き込み開始")

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateString = formatter.string(from: datePicker.date)
        
        try! realm.write {
            // 日付表示の内容とその他入力内容が書き込まれる
            let Events = [Event(value: ["date": dateString, "place": placeTextField.text!, "companion": companionTextField.text!, "seat": seatTextField.text!, "winTeam": winTeamTextField.text!, "winCount": winCountTextField.text!, "loseTeam": loseTeamTextField.text!, "loseCount": loseCountTextField.text!])]
            realm.add(Events)
            print("Events: \(Events)")
        }
        print("DEBUG PostViewController 1：データ書き込み完了")
        // ホーム画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
}
