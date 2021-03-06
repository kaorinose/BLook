//
//  CalendarViewController.swift
//  Baseball01
//
//  Created by 0003 QBS on 2020/06/02.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic
import RealmSwift

//ディスプレイサイズ取得
let w = UIScreen.main.bounds.size.width
let h = UIScreen.main.bounds.size.height

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    //スケジュール内容
    let labelDate = UILabel(frame: CGRect(x: 5, y: 555, width: 400, height: 200))
    //「観戦履歴」の表示
    let labelTitle = UILabel(frame: CGRect(x: 5, y: 525, width: 180, height: 40))
    //カレンダー部分
    let dateView = FSCalendar(frame: CGRect(x: 20, y: 50, width: w - 30, height: 400))
    //日付の表示
    let Date = UILabel(frame: CGRect(x: 5, y: 430, width: 200, height: 100))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //カレンダー設定
        self.dateView.dataSource = self
        self.dateView.delegate = self
        self.dateView.today = nil
        self.dateView.tintColor = .red
        self.view.backgroundColor = .white
        dateView.backgroundColor = .white
        view.addSubview(dateView)

        //日付表示設定
        Date.text = ""
        Date.font = UIFont.systemFont(ofSize: 50.0)
        Date.textColor = .black
        view.addSubview(Date)

        //「観戦履歴」表示設定
        labelTitle.text = ""
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 18.0)
        view.addSubview(labelTitle)

        //スケジュール内容表示設定
        labelDate.text = ""
        labelDate.font = UIFont.systemFont(ofSize: 15.0)
        view.addSubview(labelDate)

        
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    // 祝日判定を行い結果を返すメソッド
    func judgeHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)

        // 祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)

        let holiday = CalculateCalendarLogic()

        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }

    //曜日判定
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }
    
    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする
        if self.judgeHoliday(date){
            return UIColor.red
        }

        //土日の判定
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {
            return UIColor.red
        }
        else if weekday == 7 {
            return UIColor.blue
        }

        return nil
    }

    //カレンダー処理(スケジュール表示処理)
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){

        labelTitle.text = "観戦履歴"
        labelTitle.backgroundColor  = UIColor(red: 0.40, green: 0.90, blue: 0.97, alpha: 1)
        view.addSubview(labelTitle)

        //予定がある場合、スケジュールをDBから取得・表示する。
        //無い場合、「現在、観戦予定・履歴はありません」と表示。
        labelDate.text = "　現在、観戦予定・履歴はありません"
        labelDate.textColor = .lightGray
        view.addSubview(labelDate)

        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        let m = String(format: "%02d", month)
        let d = String(format: "%02d", day)

        let da = "\(year)/\(m)/\(d)"

        print("DEBUG CalendarViewController da : \(da)")
        
        //クリックしたら、日付が表示される。
        Date.text = "\(m)/\(d)"
        view.addSubview(Date)

        //スケジュール取得
        let realm = try! Realm()
        var result = realm.objects(Event.self)
        
        print("DEBUG CalendarViewController result1 : \(result)")
        
        result = result.filter("date = '\(da)'")
        
        print("DEBUG CalendarViewController result2 : \(result)")
        
        for event in result {
            if event.date == da {
                labelDate.numberOfLines = 0;
                labelDate.text = "■場所　　：\(event.place)\n" + "■同伴者　：\(event.companion)\n" + "■座席　　：\(event.seat)\n" + "■試合結果　\n" + "　勝利チーム(点数)\n" + "　　：\(event.winTeam)（\(event.winCount)）\n" + "　敗北チーム(点数)\n" + "　　：\(event.loseTeam)（\(event.loseCount)）\n"
                labelDate.textColor = .black
                view.addSubview(labelDate)
            }
        }

    }
    
    // カレンダー処理(点マークをつける処理)
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int{
        //return 1
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        let m = String(format: "%02d", month)
        let d = String(format: "%02d", day)
        let da = "\(year)/\(m)/\(d)"
        
        // 対象の日付が設定されているデータを取得する
        let realm = try! Realm()
        var result = realm.objects(Event.self)
        result = result.filter("date = '\(da)'")
        
        // 点マークの数を表示する値を設定する
        var eventCount = 0
        
        for event in result {
            if event.date == da {
                eventCount = 1
            }
        }
        return eventCount
    }
    
}
