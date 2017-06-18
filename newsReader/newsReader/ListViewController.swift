//
//  ListViewController.swift
//  newsReader
//
//  Created by sadakoa on 2017/06/18.
//  Copyright © 2017年 sadakoa. All rights reserved.
//

import UIKit

//デリゲートの指定
class ListViewController: UITableViewController, XMLParserDelegate{
    
// RSSデータを解析するためのXMLParserクラスのインスタンスを格納する
    var parser:XMLParser!
// 複数の記事を格納するための配列
    var items = [Item]()
//    Itemクラス型のプロパティ
    var item:Item?
//    抽出した文字列を一時的に格納するプロパティ
    var currentString = ""

    
    // セルの数を表示するメソッド
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //　セルの内容を設定するメソッド
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startDownload()
    }
    
//    RSSデータをダウンロードするメソッド
    func startDownload() {
        //配列を空に
        self.items = []
        //RSSデータのURL先指定
        if let url = URL(string: "http://www.apple.com/jp/pr/feeds/pr.rss") {
            //インスタンス作成
            if let parser = XMLParser(contentsOf: url) {
                //データの解析を開始
                self.parser = parser
                self.parser.delegate = self
                self.parser.parse()
            }
        }
    }
    
    func parser(_ parser: XMLParser,
                didStartElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?,
                attributes attributeDict: [String: String]) {
            self.currentString = ""
        //要素名がitemの場合のみ、ニュース記事を入れる箱をつくる
        if elementName == "item" {
            self.item = Item()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.currentString += string
    }
    
    func parser(_ parser: XMLParser,
                didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?) {
        switch elementName {
            case "title": self.item?.title = currentString
            case "link": self.item?.link = currentString
            case "item": self.items.append(self.item!)
        default : break
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let item = items[indexPath.row]
            let controller = segue.destination as! DetailViewController
            controller.title = item.title
            controller.link = item.link
        }
    }
}
