//
//  ViewController.swift
//  Subject
//
//  Created by Eren lifetime on 5.12.2023.
//
import UIKit
class ViewController:UIViewController{
    @IBOutlet weak var label1: UILabel!
    var sayac:Int = 0{
        didSet{
            label1.text = "Sayaç: \(sayac)"
        }
    }
    @IBOutlet var allButtonPressed: [UIButton]!
    @IBAction func selectCardPressed(_ sender: UIButton) {
        let emojiler = ["😅","🥹","😅","🥹"]
        sayac += 1
        if let cardNo = allButtonPressed.index(of:sender){
            flipCard(emoji: emojiler[cardNo], on: sender)
        }else{
            print(" allButtonPressed ı seçmediniz")
        }
        
        func flipCard(emoji:String,button:UIButton){
            if button.currentTitle == emoji{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = .orange
            }else{
                button.setTitle(emoji, for: UIControl.State.normal)
                button.backgroundColor = .white
            }
        }
            func otherCard(emoji:String, button:UIButton){
                if button.currentTitle == emoji{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = .orange
                }else{
                    button.setTitle(emoji, for: UIControl.State.normal)
                    button.backgroundColor = .white
                }
            }
        }
    }


