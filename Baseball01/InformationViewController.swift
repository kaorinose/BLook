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


class InformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //MapViewを生成し、表示する
        let myMapView = MKMapView()
        myMapView.frame = self.view.frame
        self.view.addSubview(myMapView)
        
        //長押しを探知する機能を追加
        //ジェスチャーの生成
        let longPressGesture = UILongPressGestureRecognizer()
        //ボタンを押したときの処理
        longPressGesture.addTarget(self, action: "longPressed:")
        myMapView.addGestureRecognizer(longPressGesture)
        
        // 背景に表示したい画像の名前(拡張子含む)を引数とする。
        //self.view.addBackground(name: "ground.jpg")
        
    }

}
