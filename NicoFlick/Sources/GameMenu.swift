//
//  GameMenu.swift
//  NicoFlick
//
//  Created by MIZUSHIKI on 2017/06/12.
//  Copyright © 2017年 i.MIZUSHIKI. All rights reserved.
//

import UIKit

class GameMenu: UIViewController {
    
    @IBOutlet var judgeOffsetLabel: UILabel!
    @IBOutlet var judgeOffsetSlider: UISlider!
    //遷移時に受け取り
    var gameViewController:GameView!
    
    //保存データ
    let userData = UserData.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var value:Float = 0.0
        if let jo = userData.JudgeOffset[gameViewController.selectLevel.sqlID] {
            value = jo
        }
        judgeOffsetSlider.value = value
        judgeOffsetLabel.text = String(format:"%0.02f",value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func JudgeOffsetSlider(_ sender: UISlider) {
        let value = Float(Int(round(sender.value*100)))/100
        sender.value = value
        judgeOffsetLabel.text = String(format:"%0.02f",value)
        userData.JudgeOffset[self.gameViewController.selectLevel.sqlID] = value
    }
    
    @IBAction func resume(_ sender: Any) {
        self.gameViewController.returnToMeData = 0
        self.performSegue(withIdentifier: "fromGameMenu", sender: self)
    }
    
    @IBAction func retry(_ sender: Any) {
        self.gameViewController.returnToMeData = 1
        self.performSegue(withIdentifier: "fromGameMenu", sender: self)
    }
    
    @IBAction func musicSelect(_ sender: Any) {
        self.gameViewController.returnToMeData = 2
        self.performSegue(withIdentifier: "fromGameMenu", sender: self)
    }
    
}

