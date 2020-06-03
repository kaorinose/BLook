//
//  TabBarViewController.swift
//  Baseball01
//
//  Created by 0003 QBS on 2020/06/02.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // タブアイコンの色
        self.tabBar.tintColor = UIColor(red: 0.1, green: 0.50, blue: 1.0, alpha: 1)
        // タブバーの背景色
        self.tabBar.barTintColor = UIColor(red: 0.40, green: 0.90, blue: 0.97, alpha: 1)
        // UITabBarControllerDelegateプロトコルのメソッドをこのクラスで処理する。
        self.delegate = self
    }
    
    // タブバーのアイコンがタップされた時に呼ばれるdelegateメソッドを処理する。
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostViewController {
            // PostViewControllerは、タブ切り替えではなくモーダル画面遷移する
            let PostViewController = storyboard!.instantiateViewController(withIdentifier: "Post")
            present(PostViewController, animated: true)
            return false
        } else {
            // その他のViewControllerは通常のタブ切り替えを実施
            return true
        }
    }

}
