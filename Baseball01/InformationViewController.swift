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
        
        // ----------------------- 所在地にピン設定 ----------------------------------
        // 福岡ソフトバンクホークス（福岡）
        // 緯度
        let fukuokaLatitude: CLLocationDegrees = 33.60639
        // 経度
        let fukuokaLongitude: CLLocationDegrees = 130.41806
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
        let tokyoLatitude: CLLocationDegrees = 35.68944
        // 経度
        let tokyoLongitude: CLLocationDegrees = 139.69167
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
        
        // ----------------------- 所在地にピン設定 ----------------------------------
        
        // --------------------- 現在位置を中心にする処理関連 --------------------------
        // 地図の初期化
        //initMap()
        // --------------------- 現在位置を中心にする処理関連 --------------------------
        
        //---------------------- 長押しを探知する機能を追加 ----------------------------
        //ジェスチャーの生成
        let longPressGesture = UILongPressGestureRecognizer()
        //ボタンを押したときの処理
        longPressGesture.addTarget(self, action:#selector(longPressed))
        mapView.addGestureRecognizer(longPressGesture)
        //---------------------- 長押しを探知する機能を追加 ----------------------------
        
    }
        
    // CLLocationManagerのdelegate：現在位置取得
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        let lonStr = (locations.last?.coordinate.longitude.description)!
        let latStr = (locations.last?.coordinate.latitude.description)!

        print("lon : " + lonStr)
        print("lat : " + latStr)
            
        // --------------------- 現在位置を中心にする処理関連 --------------------------
        //mapView.userTrackingMode = .follow
        // --------------------- 現在位置を中心にする処理関連 --------------------------
    }
        
    // --------------------- 現在位置を中心にする処理関連 --------------------------
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
    // --------------------- 現在位置を中心にする処理関連 --------------------------

    //---------------------- 長押しを探知する機能を追加 ----------------------------
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
    //---------------------- 長押しを探知する機能を追加 ----------------------------

    
}
