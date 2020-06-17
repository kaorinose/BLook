//
//  SettingViewController.swift
//  Baseball01
//
//  Created by 0003 QBS on 2020/06/02.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit
import AVFoundation

class SettingViewController: UIViewController {
    
    // 拍手用（再生・停止）
    @IBOutlet weak var play1Button: UIButton!
    @IBOutlet weak var stop1Button: UIButton!
    // 歓声用（再生・停止）
    @IBOutlet weak var play2Button: UIButton!
    @IBOutlet weak var stop2Button: UIButton!
    // 激励用（再生・停止）
    @IBOutlet weak var play3Button: UIButton!
    @IBOutlet weak var stop3Button: UIButton!
    // 労い用（再生・停止）
    @IBOutlet weak var play4Button: UIButton!
    @IBOutlet weak var stop4Button: UIButton!
    // 返事用（再生・停止）
    @IBOutlet weak var play5Button: UIButton!
    @IBOutlet weak var stop5Button: UIButton!
    // 別れ用（再生・停止）
    @IBOutlet weak var play6Button: UIButton!
    @IBOutlet weak var stop6Button: UIButton!
    
    // 拍手用URL
    let clapMusicPath = Bundle.main.bundleURL.appendingPathComponent("stadium-clapping-hands1.mp3")
    // 歓声用URL
    let cheerMusicPath = Bundle.main.bundleURL.appendingPathComponent("cheer1.mp3")
    // 激励用URL
    let encouragementMusicPath = Bundle.main.bundleURL.appendingPathComponent("line-girl1-ganbatte1.mp3")
    // 労い用URL
    let laborMusicPath = Bundle.main.bundleURL.appendingPathComponent("line-girl1-otsukaresamadesu1.mp3")
    // 返事用URL
    let replyMusicPath = Bundle.main.bundleURL.appendingPathComponent("line-girl1-haihaai1.mp3")
    // 別れ用URL
    let farewellMusicPath = Bundle.main.bundleURL.appendingPathComponent("line-girl1-byebye1.mp3")
    
    // ミュージックプレイヤーを作成
    //var musicPlayer = AVAudioPlayer()
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景に表示したい画像の名前(拡張子含む)を引数とする。
        self.view.addBackground(name: "ground.jpg")
    }
    
    // 拍手用（再生・停止ボタン）
    @IBAction func play1Button(_ sender: Any) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: clapMusicPath)
            musicPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    @IBAction func stop1Button(_ sender: Any) {
        musicPlayer.stop()
    }
    
    // 歓声用（再生・停止ボタン）
    @IBAction func play2Button(_ sender: Any) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: cheerMusicPath)
            musicPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    @IBAction func stop2Button(_ sender: Any) {
        musicPlayer.stop()
    }
    
    // 激励用（再生・停止ボタン）
    @IBAction func play3Button(_ sender: Any) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: encouragementMusicPath)
            musicPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    @IBAction func stop3Button(_ sender: Any) {
        musicPlayer.stop()
    }
    
    // 労い用（再生・停止ボタン）
    @IBAction func play4Button(_ sender: Any) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: laborMusicPath)
            musicPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    @IBAction func stop4Button(_ sender: Any) {
        musicPlayer.stop()
    }
    
    // 返事用（再生・停止ボタン）
    @IBAction func play5Button(_ sender: Any) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: replyMusicPath)
            musicPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    @IBAction func stop5Button(_ sender: Any) {
        musicPlayer.stop()
    }
    
    // 別れ用（再生・停止ボタン）
    @IBAction func play6Button(_ sender: Any) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: farewellMusicPath)
            musicPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    @IBAction func stop6Button(_ sender: Any) {
        musicPlayer.stop()
    }

    
}
