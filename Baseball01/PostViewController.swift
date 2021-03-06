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
        
        datePicker.datePickerMode = UIDatePicker.Mode.date
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)

        print("DEBUG PostViewController event: \(event)")
        
        // 新規ではない場合（編集の場合）
        if event != nil {
            // 日付の型式変換（String型→ Date型(datepicker)）
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            let dateDate = formatter.date(from: event.date)
        
            // dateDateがnil以外の場合
            if dateDate != nil {
                datePicker.date = dateDate!
            }
            // dateDateがnilの場合
            else {
                print("DEBUG PostViewController pass: pass")
            }
            
            placeTextField.text = event.place
            companionTextField.text = event.companion
            seatTextField.text = event.seat
            winTeamTextField.text = event.winTeam
            winCountTextField.text = event.winCount
            loseTeamTextField.text = event.loseTeam
            loseCountTextField.text = event.loseCount

        }
        // 新規の場合
        else {
        }
    }
    
    // 戻るボタンをタップしたときに呼ばれるメソッド
    @IBAction func returnButton(_ sender: Any) {
        // ホーム画面に戻る
        self.dismiss(animated: true, completion: nil)
    }

    // 削除ボタンをタップしたときに呼ばれるメソッド
    @IBAction func deleteButton(_ sender: Any) {
        // 新規ではない場合（編集の場合）
        if event != nil {
            // データベースからデータを削除する
            try! realm.write {
                self.realm.delete(try! Realm().objects(Event.self).filter("id=%@", event.id))
            }
        }
        // 新規の場合
        else {
        }
        // ホーム画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    // 保存ボタンをタップしたときに呼ばれるメソッド
    @IBAction func saveButton(_ sender: Any) {
        // エラーフラグ
        var error:Bool = false
        // DB書き込み処理
        print("DEBUG PostViewController 1：データ書き込み開始")

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateString = formatter.string(from: datePicker.date)
        
        // 新規ではない場合（編集の場合）
        if event != nil {
            // 日付チェック
            if dateString != "" {
                print("DEBUG PostViewController 編集：date　OK")
            }
            else {
                error = true
            }
            // 場所チェック
            if self.placeTextField.text! != "" {
                print("DEBUG PostViewController 編集：place　OK")
            }
            else {
                error = true
            }
            // 同伴者チェック
            if self.companionTextField.text! != "" {
                print("DEBUG PostViewController 編集：companion　OK")
            }
            else {
                error = true
            }
            // 座席チェック
            if self.seatTextField.text! != "" {
                print("DEBUG PostViewController 編集：seat　OK")
            }
            else {
                error = true
            }
            // 勝利チームチェック
            if self.winTeamTextField.text! != "" {
                print("DEBUG PostViewController 編集：winTeam　OK")
            }
            else {
                error = true
            }
            // 勝利点数チェック
            if self.winCountTextField.text! != "" {
                print("DEBUG PostViewController 編集：winCount　OK")
            }
            else {
                error = true
            }
            // 敗北チームチェック
            if self.loseTeamTextField.text! != "" {
                print("DEBUG PostViewController 編集：loseTeam　OK")
            }
            else {
                error = true
            }
            // 敗北点数チェック
            if self.loseCountTextField.text! != "" {
                print("DEBUG PostViewController 編集：loseCount　OK")
            }
            else {
                error = true
            }
            // エラーがなかった(false)のときは書き込み
            if !error  {
                try! realm.write {
                    self.event.date = dateString
                    self.event.place = self.placeTextField.text!
                    self.event.companion = self.companionTextField.text!
                    self.event.seat = self.seatTextField.text!
                    self.event.winTeam = self.winTeamTextField.text!
                    self.event.winCount = self.winCountTextField.text!
                    self.event.loseTeam = self.loseTeamTextField.text!
                    self.event.loseCount = self.loseCountTextField.text!
                    self.realm.add(self.event, update: .modified)
                }
                // ホーム画面に戻る
                self.dismiss(animated: true, completion: nil)
            }
            print("DEBUG PostViewController 1：データ書き込み完了")

            // 未入力項目エラーダイアログ（アラート）
            let dialog = UIAlertController(title: "入力項目エラー", message: "未入力の項目があります\n全ての項目を入力してください", preferredStyle: .alert)
            // 未入力項目エラーダイアログのボタンタイトル
            dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            // 未入力項目エラーダイアログの表示
            self.present(dialog, animated: true, completion: nil)
            
        }
        // 新規の場合
        else {
            
            self.event = Event()
            
            // 日付チェック
            if dateString != "" {
                self.event.date = dateString
            }
            else {
                error = true
            }
            // 場所チェック
            if self.placeTextField.text! != "" {
                self.event.place = self.placeTextField.text!
            }
            else {
                error = true
            }
            // 同伴者チェック
            if self.companionTextField.text! != "" {
                self.event.companion = self.companionTextField.text!
            }
            else {
                error = true
            }
            // 座席チェック
            if self.seatTextField.text! != "" {
                self.event.seat = self.seatTextField.text!
            }
            else {
                error = true
            }
            // 勝利チームチェック
            if self.winTeamTextField.text! != "" {
                self.event.winTeam = self.winTeamTextField.text!
            }
            else {
                error = true
            }
            // 勝利点数チェック
            if self.winCountTextField.text! != "" {
                self.event.winCount = self.winCountTextField.text!
            }
            else {
                error = true
            }
            // 敗北チームチェック
            if self.loseTeamTextField.text! != "" {
                self.event.loseTeam = self.loseTeamTextField.text!
            }
            else {
                error = true
            }
            // 敗北点数チェック
            if self.loseCountTextField.text! != "" {
                self.event.loseCount = self.loseCountTextField.text!
            }
            else {
                error = true
            }
            
            // 新しいIDをつける
            // 新規の場合はIDを一つカウントアップさせる
            if let lastID = self.realm.objects(Event.self).last?.id {
                self.event.id = lastID + 1
            } else {
                self.event.id = 1
            }
            
            // エラーがなかった(false)のときは書き込み
            if !error  {
                try! realm.write {
                self.realm.add(self.event, update: .modified)
                }
                // ホーム画面に戻る
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print("DEBUG PostViewController 2 ：　event nil error")
                
                // 未入力項目エラーダイアログ（アラート）
                let dialog = UIAlertController(title: "入力項目エラー", message: "未入力の項目があります\n全ての項目を入力してください", preferredStyle: .alert)
                // 未入力項目エラーダイアログのボタンタイトル
                dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                // 未入力項目エラーダイアログの表示
                self.present(dialog, animated: true, completion: nil)

            }
        print("---- 現在、保存されているイベント ---- ")
        print(realm.objects(Event.self).sorted(byKeyPath: "id", ascending: true))
        print("--------------------------------- ")
        
        }
        
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
}
