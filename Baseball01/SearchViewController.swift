//
//  SearchViewController.swift
//  Baseball01
//
//  Created by 0003 QBS on 2020/06/02.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // 戻るボタンをタップしたときに呼ばれるメソッド
    @IBAction func cancelButton(_ sender: Any) {
        // ホーム画面に戻る
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
