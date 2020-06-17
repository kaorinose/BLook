//
//  InformationViewController.swift
//  Baseball01
//
//  Created by 0003 QBS on 2020/06/02.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit
//MapKitのインポート
import MapKit
import CoreLocation


class InformationViewController: UIViewController, CLLocationManagerDelegate {

    // CLLocationManagerのメンバ変数を定義する
    @IBOutlet var mapView: MKMapView!
    var locManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // delegateを登録する
        locManager = CLLocationManager()
        locManager.delegate = self
            
        // 位置情報の使用の許可を得る
        locManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                // 座標の表示
                locManager.startUpdatingLocation()
                break
            default:
                break
            }
        }
        
        // -- ↓ --------------------- 所在地にピン設定 -------------------------------
        // 福岡ソフトバンクホークス（福岡）
        // 緯度
        let fukuokaLatitude: CLLocationDegrees = 33.595211
        // 経度
        let fukuokaLongitude: CLLocationDegrees = 130.362182
        // 中心点
        let fukuokaCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(fukuokaLatitude, fukuokaLongitude)
        // ピンを生成
        let fukuokaPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        fukuokaPin.coordinate = fukuokaCenter
        // タイトルを設定
        fukuokaPin.title = "福岡ソフトバンクホークス"
        // サブタイトルを設定
        fukuokaPin.subtitle = "(パ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(fukuokaPin)
        
        // 読売ジャイアンツ（東京）
        // 緯度
        let tokyoLatitude: CLLocationDegrees = 35.705471
        // 経度
        let tokyoLongitude: CLLocationDegrees = 139.751801
        // 中心点
        let tokyoCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(tokyoLatitude, tokyoLongitude)
        // ピンを生成
        let tokyoPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        tokyoPin.coordinate = tokyoCenter
        // タイトルを設定
        tokyoPin.title = "読売ジャイアンツ"
        // サブタイトルを設定
        tokyoPin.subtitle = "(セ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(tokyoPin)
        
        // 横浜DeNAベイスターズ（横浜）
        // 緯度
        let yokohamaLatitude: CLLocationDegrees = 35.443086
        // 経度
        let yokohamaLongitude: CLLocationDegrees = 139.64005
        // 中心点
        let yokohamaCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(yokohamaLatitude, yokohamaLongitude)
        // ピンを生成
        let yokohamaPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        yokohamaPin.coordinate = yokohamaCenter
        // タイトルを設定
        yokohamaPin.title = "横浜DeNAベイスターズ"
        // サブタイトルを設定
        yokohamaPin.subtitle = "(セ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(yokohamaPin)
        
        // 阪神タイガース（兵庫）
        // 緯度
        let hyogoLatitude: CLLocationDegrees = 34.721394
        // 経度
        let hyogoLongitude: CLLocationDegrees = 135.361594
        // 中心点
        let hyogoCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(hyogoLatitude, hyogoLongitude)
        // ピンを生成
        let hyogoPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        hyogoPin.coordinate = hyogoCenter
        // タイトルを設定
        hyogoPin.title = "阪神タイガース"
        // サブタイトルを設定
        hyogoPin.subtitle = "(セ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(hyogoPin)
        
        // 広島東洋カープ（広島）
        // 緯度
        let hiroshimaLatitude: CLLocationDegrees = 34.392028
        // 経度
        let hiroshimaLongitude: CLLocationDegrees = 132.484678
        // 中心点
        let hiroshimaCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(hiroshimaLatitude, hiroshimaLongitude)
        // ピンを生成
        let hiroshimaPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        hiroshimaPin.coordinate = hiroshimaCenter
        // タイトルを設定
        hiroshimaPin.title = "広島東洋カープ"
        // サブタイトルを設定
        hiroshimaPin.subtitle = "(セ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(hiroshimaPin)
        
        // 中日ドラゴンズ（名古屋）
        // 緯度
        let nagoyaLatitude: CLLocationDegrees = 35.185805
        // 経度
        let nagoyaLongitude: CLLocationDegrees = 136.947498
        // 中心点
        let nagoyaCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(nagoyaLatitude, nagoyaLongitude)
        // ピンを生成
        let nagoyaPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        nagoyaPin.coordinate = nagoyaCenter
        // タイトルを設定
        nagoyaPin.title = "中日ドラゴンズ"
        // サブタイトルを設定
        nagoyaPin.subtitle = "(セ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(nagoyaPin)
        
        // 東京ヤクルトスワローズ（明治）
        // 緯度
        let meijiLatitude: CLLocationDegrees = 35.67452
        // 経度
        let meijiLongitude: CLLocationDegrees = 139.717083
        // 中心点
        let meijiCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(meijiLatitude, meijiLongitude)
        // ピンを生成
        let meijiPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        meijiPin.coordinate = meijiCenter
        // タイトルを設定
        meijiPin.title = "東京ヤクルトスワローズ"
        // サブタイトルを設定
        meijiPin.subtitle = "(セ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(meijiPin)
        
        // 埼玉西武ライオンズ（埼玉）
        // 緯度
        let saitamaLatitude: CLLocationDegrees = 35.768479
        // 経度
        let saitamaLongitude: CLLocationDegrees = 139.420484
        // 中心点
        let saitamaCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(saitamaLatitude, saitamaLongitude)
        // ピンを生成
        let saitamaPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        saitamaPin.coordinate = saitamaCenter
        // タイトルを設定
        saitamaPin.title = "埼玉西武ライオンズ"
        // サブタイトルを設定
        saitamaPin.subtitle = "(パ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(saitamaPin)
        
        // 東北楽天ゴールデンイーグルス（仙台）
        // 緯度
        let sendaiLatitude: CLLocationDegrees = 38.256599
        // 経度
        let sendaiLongitude: CLLocationDegrees = 140.902609
        // 中心点
        let sendaiCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(sendaiLatitude, sendaiLongitude)
        // ピンを生成
        let sendaiPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        sendaiPin.coordinate = sendaiCenter
        // タイトルを設定
        sendaiPin.title = "東北楽天ゴールデンイーグルス"
        // サブタイトルを設定
        sendaiPin.subtitle = "(パ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(sendaiPin)
        
        // 千葉ロッテマリーンズ（千葉）
        // 緯度
        let chibaLatitude: CLLocationDegrees = 35.645444
        // 経度
        let chibaLongitude: CLLocationDegrees = 140.031186
        // 中心点
        let chibaCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(chibaLatitude, chibaLongitude)
        // ピンを生成
        let chibaPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        chibaPin.coordinate = chibaCenter
        // タイトルを設定
        chibaPin.title = "千葉ロッテマリーンズ"
        // サブタイトルを設定
        chibaPin.subtitle = "(パ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(chibaPin)
        
        // 北海道日本ハムファイターズ（北海道）
        // 緯度
        let hokkaidoLatitude: CLLocationDegrees = 43.014846
        // 経度
        let hokkaidoLongitude: CLLocationDegrees = 141.410007
        // 中心点
        let hokkaidoCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(hokkaidoLatitude, hokkaidoLongitude)
        // ピンを生成
        let hokkaidoPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        hokkaidoPin.coordinate = hokkaidoCenter
        // タイトルを設定
        hokkaidoPin.title = "北海道日本ハムファイターズ"
        // サブタイトルを設定
        hokkaidoPin.subtitle = "(パ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(hokkaidoPin)
        
        // オリックス・バファローズ（大阪）
        // 緯度
        let osakaLatitude: CLLocationDegrees = 34.669359
        // 経度
        let osakaLongitude: CLLocationDegrees = 135.476274
        // 中心点
        let osakaCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(osakaLatitude, osakaLongitude)
        // ピンを生成
        let osakaPin: MKPointAnnotation = MKPointAnnotation()
        // 座標を設定
        osakaPin.coordinate = osakaCenter
        // タイトルを設定
        osakaPin.title = "オリックス・バファローズ"
        // サブタイトルを設定
        osakaPin.subtitle = "(パ・リーグ)"
        // MapViewにピンを追加.
        mapView.addAnnotation(osakaPin)
        // -- ↑ --------------------- 所在地にピン設定 -------------------------------
        
        // -- ↓ -------------------- ピンタップを探知する機能を追加 ---------------------
        // ジェスチャーの生成
        let TapGesture = UITapGestureRecognizer()
        //ボタンを押したときの処理
        TapGesture.addTarget(self, action:#selector(TapPin))
        mapView.addGestureRecognizer(TapGesture)
        // -- ↑ -------------------- ピンタップを探知する機能を追加 ---------------------
        
        // -- ↓ ----------------- 現在位置を中心にする処理関連 -------------------------
        // 地図の初期化
        //initMap()
        // -- ↑ ----------------- 現在位置を中心にする処理関連 -------------------------
        
        // -- ↓ ------------------ 長押しを探知する機能を追加 --------------------------
        //ジェスチャーの生成
        let longPressGesture = UILongPressGestureRecognizer()
        //ボタンを押したときの処理
        longPressGesture.addTarget(self, action:#selector(longPressed))
        mapView.addGestureRecognizer(longPressGesture)
        // -- ↑ -------------------- 長押しを探知する機能を追加 ------------------------
        
    }
        
    // -- ↓ --------------------- ピンタップ時の機能を追加 ----------------------------
    // ピンをタップした時の処理
    @objc func TapPin(sender: UITapGestureRecognizer) {
        // どのピンがタップされたか取得
        //let title = view.annotation?.title

        let fukuokaUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let tokyoUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let yokohamaUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let hyogoUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let hiroshimaUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let meijiUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let nagoyaUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let saitamaUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let sendaiUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let chibaUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let hokkaidoUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        let osakaUrl = URL(string: "https://www.softbankhawks.co.jp/")!
        
        // ピンに対応するURLを開く
        if UIApplication.shared.canOpenURL(fukuokaUrl) {
                UIApplication.shared.open(fukuokaUrl)
        }
    }
    // -- ↑ --------------------- ピンタップ時の機能を追加 ----------------------------
    
    // CLLocationManagerのdelegate：現在位置取得
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        let lonStr = (locations.last?.coordinate.longitude.description)!
        let latStr = (locations.last?.coordinate.latitude.description)!

        print("lon : " + lonStr)
        print("lat : " + latStr)
            
        // -- ↓ ---------------- 現在位置を中心にする処理関連 ------------------------
        //mapView.userTrackingMode = .follow
        // -- ↑ ---------------- 現在位置を中心にする処理関連 ------------------------
    }
        
    // -- ↓ ------------------ 現在位置を中心にする処理関連 --------------------------
    // 地図の初期化関数
    func initMap() {
        // 縮尺を設定
        var region:MKCoordinateRegion = mapView.region
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        mapView.setRegion(region,animated:true)

        // 現在位置表示の有効化
        mapView.showsUserLocation = true
        // 現在位置設定（デバイスの動きとしてこの時の一回だけ中心位置が現在位置で更新される）
        mapView.userTrackingMode = .follow
    }
        
    //地図の中心位置の更新関数
    func updateCurrentPos(_ coordinate:CLLocationCoordinate2D) {
        var region:MKCoordinateRegion = mapView.region
        region.center = coordinate
        mapView.setRegion(region,animated:true)
    }
    // -- ↑ ------------------ 現在位置を中心にする処理関連 --------------------------

    // -- ↓ ------------------- 長押しを探知する機能を追加 ---------------------------
    // 長押しした時にピンを置く処理
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
        
        // この処理を書くことにより、指を離したときだけ反応するようにする
        if sender.state != UIGestureRecognizer.State.began {
            return
        }

        // senderから長押しした地図上の座標を取得
        let tappedLocation = sender.location(in:mapView)
        let tappedPoint = mapView.convert(tappedLocation, toCoordinateFrom: mapView)

        // ピンの生成
        let pin = MKPointAnnotation()
        // ピンを置く場所を指定
        pin.coordinate = tappedPoint
        // ピンのタイトルを設定
        pin.title = "タイトル"
        // ピンのサブタイトルの設定
        pin.subtitle = "サブタイトル"
        // ピンをMapViewの上に置く
        self.mapView.addAnnotation(pin)

    }
    // -- ↑ ------------------- 長押しを探知する機能を追加 ---------------------------

    
}
