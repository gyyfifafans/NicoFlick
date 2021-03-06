//
//  SelectorMenuTableForSort.swift
//  NicoFlick
//
//  Created by MIZUSHIKI on 2017/09/29.
//  Copyright © 2017年 i.MIZUSHIKI. All rights reserved.
//

import Foundation

class TableViewForSort: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    
    //音楽データ(シングルトン)
    var musicDatas:MusicDataLists = MusicDataLists.sharedInstance
    //保存データ
    let userData = UserData.sharedInstance
    
    //遷移時に受け取り
    var selectorMenuController:SelectorMenu!
    //var list:[String] = []
    var mode = 0
    
    //テーブル表示項目
    var list = SelectConditions.SortItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = userData.SelectedMusicCondition.sortItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを作る
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")//tableView.dequeueReusableCell(withIdentifier: "rankCell", for: indexPath)
        cell.textLabel!.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // セルの数を設定
        print(list.count)
        return list.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return ""
     }*/
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルがタップされた時の処理
        
        if(textField.isFirstResponder){
            textField.resignFirstResponder()
        }
        print("タップされたセルのindex番号: \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        

        if (textField.text?.contains(list[indexPath.row]))! {
            return
        }
        textField.text = list[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // セルの高さを設定
        return 50
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // アクセサリボタン（セルの右にあるボタン）がタップされた時の処理
        print("タップされたアクセサリがあるセルのindex番号: \(indexPath.row)")
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        if(textField.isFirstResponder){
            textField.resignFirstResponder()
        }
    }
    
    //MARK: キーボードが出ている状態で、キーボード以外をタップしたらキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //非表示にする。
        if(textField.isFirstResponder){
            textField.resignFirstResponder()
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //画面遷移処理_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("seg")
        userData.SelectedMusicCondition.sortItem = textField.text!
    }
}
