//
//  ViewController.swift
//  NSUserDefaultsExampleApp
//
//  Created by Dino Musliu on 20/07/2016.
//  Copyright © 2016 Dino Musliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var favLabel: UILabel!
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favLabel.text = "Favorite color: \(color)" //ako postoji value u memoriji
        } else { // ako nikad nije spremljeno
            favLabel.text = "Pick a color"
        }
        
        let personA = Person(first: "Dino", last: "Musliu")
        let personB = Person(first: "Lady", last: "Gaga")
        let personC = Person(first: "Mick", last: "Jager")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    

    @IBAction func redBtn(sender: AnyObject) {
        let red = "Red"
        favLabel.text = "Favorite Color: \(red)"
        NSUserDefaultFunkcija(red)
    }

    @IBAction func yellowBtn(sender: AnyObject) {
        let yellow = "Yellow"
        favLabel.text = "Favorite Color: \(yellow)"
        NSUserDefaultFunkcija(yellow)
    }
    
    @IBAction func blueBtn(sender: AnyObject) {
        let blue = "Blue"
        favLabel.text = "Favorite Color: \(blue)"
        NSUserDefaultFunkcija(blue)
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData{ // dohavti object people tipa NSDATA
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person]{ // unarchive data koji smo dohvatili -> loadedpeople i pretvaramo u [Person]
                
                for p in peopleArray{
                    print(p.firstName)
                }
            }
        }
    }
    
    func NSUserDefaultFunkcija(colorVar: String){
        
        //NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "color")
        NSUserDefaults.standardUserDefaults().setValue(colorVar, forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    
    }
    
}

