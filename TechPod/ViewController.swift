//
//  ViewController.swift
//  TechPod
//
//  Created by 坂本 弘成 on 2016/02/13.
//  Copyright © 2016年 坂本 弘成. All rights reserved.
//

import UIKit
import AVFoundation

// UItabelViewのDatadource(データソース)メソッドをつかうための「プロトコル宣言」を行う
//　UItabelViewのdelegate(デリゲート)メソッドをつかうための「プロトコル宣言」を行う
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    // storybourdでつかうtableviewを宣言
    @IBOutlet var table: UITableView!
    //曲名を入れるための配列
    var songNameArray = [String]()
    //曲のファイルを入れるためのファイル
    var fileNameArray = [String]()
    //音楽家の画像名を入れるための配列
    var imageNameArray = [String]()
    //音楽を再生させるための変数
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //　テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
        table.dataSource = self
        
        //UITabeleが持ってるデリゲートメソッドの処理の委託先をViewController.swiftに設定
        table.delegate = self
        
        //songNameArrayに曲名を入れていく
        songNameArray = ["カノン","エリーゼのために","G線上のアリア","noname"]
        
        //　fileNameArrayに曲名を入れていく
        fileNameArray = ["cannon","elise","aria","noname"]
        
        // imageArrayに音楽家の画像を入れていく
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg","noname"]
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
        //代表のlabelを複製する回数
    }
   // ID付きのセルを取得して、セル付属のtextlabelに「テスト」と表示させてみる
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
    //Indexpathは複製されたlabelの枚数を取得
    //たぶん0から数える
        cell.textLabel?.text = songNameArray[indexPath.row]
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath
        : NSIndexPath) {
        NSLog("%@がよばれました",songNameArray[indexPath.row])
        
        //音楽ファイルの設定
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[indexPath.row], ofType: "mp3")!)
            
        audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)
            
            audioPlayer.play()
    }

}

