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
            
        // --------------------- 現在位置を中心にする処理関連 --------------------------
        // 地図の初期化
        //initMap()
        // --------------------- 現在位置を中心にする処理関連 --------------------------
        
        //---------------------- 長押しを探知する機能を追加 ----------------------------
        //ジェスチャーの生成
        //let longPressGesture = UILongPressGestureRecognizer()
        //ボタンを押したときの処理
        //longPressGesture.addTarget(self, action: "longPressed:")
        //myMapView.addGestureRecognizer(longPressGesture)
        //---------------------- 長押しを探知する機能を追加 ----------------------------
        
        // 背景に表示したい画像の名前(拡張子含む)を引数とする。
        //self.view.addBackground(name: "ground.jpg")
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

}
