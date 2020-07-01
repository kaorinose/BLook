//
//  SearchViewController.swift
//  Baseball01
//
//  Created by 0003 QBS on 2020/06/02.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit
import RealmSwift

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // テーブルビュー
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchText: UISearchBar!
    
    // Realmインスタンスを取得する
    let realm = try! Realm()
    
    // DB内のタスクが格納されるリスト。
    // 日付の近い順でソート：昇順
    // 以降内容をアップデートするとリスト内は自動的に更新される。
    var eventArray = try! Realm().objects(Event.self).sorted(byKeyPath: "date", ascending: true)

    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        // 検索バーの初期化
        searchText.delegate = self
        searchText.placeholder = "場所を入力したら検索できるよ"
    }
    
    // 渡された文字列を含む要素を検索し、テーブルビューを再表示する
    func searchItems(searchText: String) {
        //要素を検索する（%@：searchTextで入力された値）
        if searchText != "" {
            eventArray = realm.objects(Event.self).filter("place = %@", searchText).sorted(byKeyPath: "date", ascending: true)
        }
        // tableViewを再読み込みする
        tableView.reloadData()
    }
    
    // 検索ボタンがタップされた時
    func searchBarSearchButtonClicked(_ searchText: UISearchBar) {
        // 編集時、キャンセルボタンを有効
        searchText.showsCancelButton = true
        // 検索する
        searchItems(searchText: searchText.text! as String)
    }
    
    // キャンセルボタンがタップされた時
    func searchBarCancelButtonClicked(_ searchText: UISearchBar) {
        // 検索バーを空にする
        searchText.text = ""
        // キーボードを隠す
        searchText.resignFirstResponder()
        // 全てを表示
        eventArray = try! Realm().objects(Event.self).sorted(byKeyPath: "date", ascending: true)
        // tableViewを再読み込みする
        tableView.reloadData()
    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArray.count
    }

    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Cellに値を設定する
        let event = eventArray[indexPath.row]
        cell.textLabel?.text = event.place
        cell.detailTextLabel?.text = event.date
        return cell
    }

    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cellSegue",sender: nil)
    }

    // セルが削除が可能なことを伝えるメソッド
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
        return .delete
    }

    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // データベースから削除する
            try! realm.write {
                self.realm.delete(self.eventArray[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

    // segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let postViewController:PostViewController = segue.destination as! PostViewController

        if segue.identifier == "cellSegue" {
            let indexPath = self.tableView.indexPathForSelectedRow
            postViewController.event = eventArray[indexPath!.row]
        } else {
            let event = Event()

            let allEvents = realm.objects(Event.self)
            if allEvents.count != 0 {
                event.id = allEvents.max(ofProperty: "id")! + 1
            }

            postViewController.event = event
        }
    }
    
    // 入力画面から戻ってきた時に TableView を更新させる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // 戻るボタンをタップしたときに呼ばれるメソッド
    @IBAction func cancelButton(_ sender: Any) {
        // ホーム画面に戻る
        self.dismiss(animated: true, completion: nil)
    }

    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
}
