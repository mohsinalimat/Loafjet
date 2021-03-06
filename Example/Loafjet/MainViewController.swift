//
//  ViewController.swift
//  Loafjet
//
//  Created by gokulnair2001 on 01/22/2021.
//  Copyright (c) 2021 gokulnair2001. All rights reserved.
//

import UIKit
import Loafjet

class LoafTypes{
    var loafName: String?
    var loafType: [String]?
    var loafAnimation: [String]?
    
    init(loafName: String?, loafType: [String], loafAnimation: [String]) {
        self.loafName = loafName
        self.loafType = loafType
        self.loafAnimation = loafAnimation
    }
}
class MainViewController: UIViewController {
    
    var loafTypes = [LoafTypes]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Array Data
        loafTypes.append(LoafTypes.init(loafName: "Plain Loaf", loafType: ["Top","Centre", "Centre","Bottom"], loafAnimation: ["Top -> Bottom", "Left -> Right", "Right -> Left","Bottom -> Top"]))
        loafTypes.append(LoafTypes.init(loafName: "Gradient Loaf", loafType: ["Top","Centre", "Centre","Bottom"], loafAnimation: ["Top -> Bottom", "Left -> Right", "Right -> Left","Bottom -> Top"]))
        loafTypes.append(LoafTypes.init(loafName: "Popup Card", loafType: ["Centre"], loafAnimation: ["Only one type of animation"]))
        loafTypes.append(LoafTypes.init(loafName: "Loaf Wheel", loafType: ["Centre"], loafAnimation: ["Only one type of animation"]))
        loafTypes.append(LoafTypes.init(loafName: "Customized Loafs", loafType: ["Xcode","Airpods","Error","Sucessful","Warning","Information","Do Not Disturb"], loafAnimation: ["","","","","","",""]))
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK:- Tableview Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return loafTypes.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loafTypes[section].loafType?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = loafTypes[indexPath.section].loafType?[indexPath.row]
        cell.detailTextLabel?.text = loafTypes[indexPath.section].loafAnimation?[indexPath.row]
        cell.isSelected = false
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return loafTypes[section].loafName
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print("\(indexPath.section)\(indexPath.row)")
        let CellNo = Int("\(indexPath.section)\(indexPath.row)")
        performTask(cellNo: CellNo!)
    }
    
    //MARK:- Test run method
    func performTask(cellNo: Int){
        switch cellNo {
        case 0:
            Loaf.PlainLoaf(message: "Welcome", position: .top, loafWidth: 200, loafHeight: 40, cornerRadius: 20, fontStyle: "Avenir-Medium", fontSize: 17, bgColor: .gray, fontColor: .black, loafImage: nil, animationDirection: .Top, duration: 2, loafjetView: view)
            break
        case 1:
            Loaf.PlainLoaf(message: "LOAFJET", position: .center, loafWidth: 200, loafHeight: 40, cornerRadius: 20, fontStyle: "Avenir", fontSize: 17, bgColor: .systemOrange, fontColor: .black, loafImage: nil, animationDirection: .Left, duration: 2, loafjetView: view)
            break
        case 2:
            Loaf.PlainLoaf(message: "Plain Loafjet", position: .center, loafWidth: 220, loafHeight: 40, cornerRadius: 20, fontStyle: "Avenir-Medium", fontSize: 17, bgColor: .brown, fontColor: .white, loafImage: "Logo", animationDirection: .Right, duration: 2, loafjetView: view)
            break
        case 3:
            Loaf.PlainLoaf(message: "🚀 Loafjet   ", position: .bottom, loafWidth: 200, loafHeight: 40, cornerRadius: 20, fontStyle: "Avenir-Heavy", fontSize: 17, bgColor: .black, fontColor: .white, loafImage: nil, animationDirection: .Bottom, duration: 2, loafjetView: view)
            break
        case 10:
            Loaf.GradientLoaf(message: "Grad LoafJet", position: .top, loafWidth: 250, loafHeight: 45, cornerRadius: 5, fontStyle: "Avenir-Heavy", fontSize: 17, bgColor1: .systemPink, bgColor2: .systemOrange, fontColor: .black, loafImage: "Logo", animationDirection: .Top, duration: 2, loafjetView: view)
            break
        case 11:
            Loaf.GradientLoaf(message: "Xcode Loading", position: .center, loafWidth: 250, loafHeight: 40, cornerRadius: 10, fontStyle: "Avenir-Medium", fontSize: 16, bgColor1: .systemRed, bgColor2: .systemBlue, fontColor: .black, loafImage: "Xcode", animationDirection: .Left, duration: 2, loafjetView: view)
            break
        case 12:
            Loaf.GradientLoaf(message: "Airpods Detected", position: .center, loafWidth: 250, loafHeight: 40, cornerRadius: 20, fontStyle: "Avenir-Medium", fontSize: 16, bgColor1: .brown, bgColor2: .cyan, fontColor: .black, loafImage: "Airpods", animationDirection: .Right, duration: 2, loafjetView: view)
            break
        case 13:
            Loaf.GradientLoaf(message: "HomePod Mini Detected", position: .bottom, loafWidth: 300, loafHeight: 50, cornerRadius: 20, fontStyle: "Avenir-Heavy", fontSize: 17, bgColor1: .systemPink, bgColor2: .black, fontColor: .white, loafImage: "HomePodMini", animationDirection: .Bottom, duration: 2, loafjetView: view)
            break
        case 20:
            if #available(iOS 12.0, *) {
                Loaf.PopupCard(message: "Loafjet is a custom library used to add Toast, Popup Card and Loading indicator in your Swift project.", loafWidth: 250, loafHeight: 300, cornerRadius: 20, fontStyle: "Avenir-Medium", fontSize: 17, bgColor1: .black, bgColor2: .systemRed, fontColor: .white, loafImage: "Logo", duration: 5, blurEffect: .dark, loafjetView: view)
            } else {
                print("Pod LoafJet: Your device dont support this blur effect type (require iOS 10.0+)")
            }
            break
        case 30:
            if #available(iOS 12.0, *) {
                Loaf.LoafWheel(message: "LoafJet loading!", loafWidth: 250, loafHeight: 90, cornerRadius: 20, bgColor1: .systemPink, bgColor2: .systemOrange, fontStyle: "Avenir-Heavy", fontSize: 18, fontColor: .white, duration: 5, wheelStyle: .whiteLarge, blurEffect: .dark, loafWheelView: view)
            } else {
                print("Pod LoafJet: Your device dont support this blur effect type (require iOS 10.0+)")
            }
            break
        case 40:
            Loaf.PlainLoaf(message: "Xcode", position: .top, loafWidth: 200, loafHeight: 40, cornerRadius: 10, fontStyle: "Avenir-Medium", fontSize: 17, bgColor: .systemBlue, fontColor: .black, loafImage: "Xcode", animationDirection: .Top, duration: 2, loafjetView: view)
            break
        case 41:
            Loaf.PlainLoaf(message: "AirPods Connected", position: .top, loafWidth: 250, loafHeight: 50, cornerRadius: 20, fontStyle: "Avenir-Medium", fontSize: 16, bgColor: .systemGray, fontColor: .white, loafImage: "Airpods", animationDirection: .Top, duration: 2, loafjetView: view)
            break
        case 42:
            Loaf.PlainLoaf(message: "Error Found! LoafJet", position: .bottom, loafWidth: 250, loafHeight: 40, cornerRadius: 10, fontStyle: "Avenir-Heavy", fontSize: 16, bgColor: .systemRed, fontColor: .white, loafImage: "error", animationDirection: .Bottom, duration: 2, loafjetView: view)
            break
        case 43:
            Loaf.PlainLoaf(message: "Completion LoafJet", position: .bottom, loafWidth: 250, loafHeight: 40, cornerRadius: 10, fontStyle: "Avenir-Medium", fontSize: 16, bgColor: .systemGreen, fontColor: .white, loafImage: "success", animationDirection: .Bottom, duration: 2, loafjetView: view)
            break
        case 44:
            Loaf.PlainLoaf(message: "Warning LoafJet", position: .bottom, loafWidth: 250, loafHeight: 40, cornerRadius: 10, fontStyle: "Avenir-Heavy", fontSize: 17, bgColor: .systemYellow, fontColor: .white, loafImage: "warning", animationDirection: .Bottom, duration: 2, loafjetView: view)
            break
        case 45:
            Loaf.PlainLoaf(message: "Information LoafJet", position: .bottom, loafWidth: 250, loafHeight: 40, cornerRadius: 10, fontStyle: "Avenir-Medium", fontSize: 17, bgColor: .systemOrange, fontColor: .white, loafImage: "info", animationDirection: .Bottom, duration: 2, loafjetView: view)
            break
        case 46:
            if #available(iOS 13.0, *) {
                Loaf.PlainLoaf(message: "Do Not Disturb LoafJet", position: .bottom, loafWidth: 280, loafHeight: 40, cornerRadius: 10, fontStyle: "Avenir-Medium", fontSize: 16, bgColor: .systemIndigo, fontColor: .white, loafImage: "DND", animationDirection: .Bottom, duration: 2, loafjetView: view)
            } else {
                print("Pod LoafJet: Your device dont support this color type (require iOS 13.0+)")
            }
            break
        default:
            print("Error")
        }
    }
}
