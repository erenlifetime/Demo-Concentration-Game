//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Eren lifetime on 15.03.2024.
//

import UIKit
class ConcentrationThemeChooserViewController:UIViewController, UISplitViewControllerDelegate{
let themes = [
    "Sports":"⚽️🏀🏈🏐🎾",
    "Animals":"🐶🐱🐹🦊🐻",
    "Faces": "😃😆🥹😊😗",
]
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    func splitViewController(_ splitViewController:UISplitViewController,collapseSecondary secondaryViewController:UIViewController,onto primaryViewController:UIViewController)-> Bool{
        if let cvcv = secondaryViewController as? ConcentrationViewController{
            if cvcv.theme == nil{
                return true
            }
        }
        return false
    }
// Sport , Faces , Animals butonlarımı sürükleyip bıraktım. 3 ünü de
    @IBAction func changeTheme(_ sender: Any) {
// the first time we segueted to it and we grabbid it. And the next time we just pushed  it on the navigatonStack and set.
        if let cvcv = splitViewDetailConcentrationViewController{
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                cvcv.theme = theme
                }
        }else if let cvcv = lastSeguedToConcentrationViewController{
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                cvcv.theme = theme
            };navigationController?.pushViewController(cvcv, animated: true)
        }else{
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
private var splitViewDetailConcentrationViewController:ConcentrationViewController? {
    return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
private var lastSeguedToConcentrationViewController:ConcentrationViewController?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme"{
if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
        if var cvcv = segue.destination as? ConcentrationViewController {
            cvcv.theme = theme
            lastSeguedToConcentrationViewController = cvcv
            }
    }
            }
        }
    }
