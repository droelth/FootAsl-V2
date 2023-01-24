//
//  ViewController.swift
//  FootAsl Alternative
//
//  Created by Berkay Sutlu on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBOutlet weak var mc1Lbl: UILabel!
    @IBOutlet weak var mc2Lbl: UILabel!
    @IBOutlet weak var mc3Lbl: UILabel!
    @IBOutlet weak var mc4Lbl: UILabel!
    
    
    @IBOutlet weak var tHome1: UILabel!
    @IBOutlet weak var tHome2: UILabel!
    @IBOutlet weak var tAway1: UILabel!
    @IBOutlet weak var tAway2: UILabel!
    
    @IBOutlet weak var tH1Score: UILabel!
    @IBOutlet weak var tH2Score: UILabel!
    @IBOutlet weak var tA1Score: UILabel!
    @IBOutlet weak var tA2Score: UILabel!
    
    @IBOutlet weak var teamL1: UILabel!
    @IBOutlet weak var teamL2: UILabel!
    @IBOutlet weak var teamL3: UILabel!
    @IBOutlet weak var teamL4: UILabel!
    
    
    @IBOutlet weak var teamL1P: UILabel!
    @IBOutlet weak var teamL2P: UILabel!
    @IBOutlet weak var teamL3P: UILabel!
    @IBOutlet weak var teamL4P: UILabel!
    

    var real = footballTeam(name: "Real Madrid", attackpower: 95, defencepower: 72)
    var juve = footballTeam(name: "Juventus", attackpower: 89, defencepower: 80)
    var bayern = footballTeam(name: "Bayern Munih", attackpower: 90, defencepower: 75)
    var city = footballTeam(name: "Man.City", attackpower: 96, defencepower: 79)
    
    
    var sayac = 0
    var t1score = 0
    var t2score = 0
    var t3score = 0
    var t4score = 0
    var t1Point = 0
    var t2Point = 0
    var t3Point = 0
    var t4Point = 0
    
    var bayernpoint = 0
    var realpoint = 0
    var citypoint = 0
    var juvepoint = 0
    
    
    
    
    func increaseCount(){
        mc1Lbl.text = String(sayac)
        mc2Lbl.text = String(sayac)
        mc3Lbl.text = String(sayac)
        mc4Lbl.text = String(sayac)
    }
    
    func howManyGoalsScored(ap: Int, dp: Int) -> Int {
        let def:Double = Double(ap) - Double(dp)
        let rnd = Double.random(in: 0...def)
        
        if rnd > 0 && rnd < 4
        { return 0 }
        else if rnd >= 4 && rnd < 8
        { return 1 }
        else if rnd >= 8 && rnd < 12
        { return 2 }
        else if rnd >= 12 && rnd < 16
        { return 3 }
        else if rnd >= 16 && rnd < 20
        { return 4 }
        else
        { return 5 }
    }
    
    func whereReal(t1Point :Int,t2Point :Int,t3Point :Int,t4Point :Int)
    {
        if tHome1.text == "Real Madrid" {
            realpoint = realpoint + t1Point
            
        }
        else if tAway1.text == "Real Madrid" {
            realpoint = realpoint + t2Point
        }
        else if tHome2.text == "Real Madrid" {
            realpoint = realpoint + t3Point
        }
        else if tAway2.text == "Real Madrid" {
            realpoint = realpoint + t4Point
        }
    }
    
    func whereBayern(t1Point :Int,t2Point :Int,t3Point :Int,t4Point :Int)
    {
        if tHome1.text == "Bayern Munih" {
            bayernpoint = bayernpoint + t1Point
        }
        else if tAway1.text == "Bayern Munih" {
            bayernpoint = bayernpoint + t2Point
        }
        else if tHome2.text == "Bayern Munih" {
            bayernpoint = bayernpoint + t3Point
        }
        else if tAway2.text == "Bayern Munih" {
            bayernpoint = bayernpoint + t4Point
        }
    }
    func whereJuve(t1Point :Int,t2Point :Int,t3Point :Int,t4Point :Int)
    {
        if tHome1.text == "Juventus" {
            juvepoint = juvepoint + t1Point
        }
        else if tAway1.text == "Juventus" {
            juvepoint = juvepoint + t2Point
        }
        else if tHome2.text == "Juventus" {
            juvepoint = juvepoint + t3Point
        }
        else if tAway2.text == "Juventus" {
            juvepoint = juvepoint + t4Point
        }
    }
    func whereCity(t1Point :Int,t2Point :Int,t3Point :Int,t4Point :Int)
    {
        if tHome1.text == "Man.City" {
            citypoint = citypoint + t1Point
        }
        else if tAway1.text == "Man.City" {
            citypoint = citypoint + t2Point
        }
        else if tHome2.text == "Man.City" {
            citypoint = citypoint + t3Point
        }
        else if tAway2.text == "Man.City" {
            citypoint = citypoint + t4Point
        }
    }
    
    
    
    @IBAction func getFixtureBtn(_ sender: UIButton) {
        var teamArray = [real,city,juve,bayern]
        teamArray.shuffle()
        
        var t1Point = 0
        var t2Point = 0
        var t3Point = 0
        var t4Point = 0
        
        let h1 = teamArray[0]
        let a1 = teamArray[1]
        let h2 = teamArray[2]
        let a2 = teamArray[3]
        
        tHome1.text = h1.name
        tAway1.text = a1.name
        tHome2.text = h2.name
        tAway2.text = a2.name
        
        t1score = howManyGoalsScored(ap: h1.attackpower, dp: a1.defencepower)
        t2score = howManyGoalsScored(ap: a1.attackpower, dp: h1.defencepower)
        t3score = howManyGoalsScored(ap: h2.attackpower, dp: a2.defencepower)
        t4score = howManyGoalsScored(ap: a2.attackpower, dp: h2.defencepower)
        
        tH1Score.text = String(t1score)
        tA1Score.text = String(t2score)
        tH2Score.text = String(t3score)
        tA2Score.text = String(t4score)
        
        
        
        if t1score > t2score {
            t1Point = 3
        }
        else if t2score > t1score {
            t2Point = 3
        }
        else if t1score == t2score {
            t1Point = 1
            t2Point = 1
        }
            
        if t3score > t4score {
            t3Point = 3
        }
        else if t4score > t3score {
            t4Point = 3
        }
        else if t3score == t4score{
            t3Point = t3Point + 1
            t4Point = t4Point + 1
        }
     
        
        whereBayern(t1Point: t1Point, t2Point: t2Point, t3Point: t3Point, t4Point: t4Point)
        whereReal(t1Point: t1Point, t2Point: t2Point, t3Point: t3Point, t4Point: t4Point)
        whereJuve(t1Point: t1Point, t2Point: t2Point, t3Point: t3Point, t4Point: t4Point)
        whereCity(t1Point: t1Point, t2Point: t2Point, t3Point: t3Point, t4Point: t4Point)
        
        
            
        teamL1P.text = String(bayernpoint)
        teamL2P.text = String(realpoint)
        teamL3P.text = String(juvepoint)
        teamL4P.text = String(citypoint)
        sayac = sayac + 1
        
        increaseCount()
    }
    
}
