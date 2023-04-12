//
//  ThemeViewController.swift
//  DarkTheme
//
//  Created by patricija.vainovska on 12/04/2023.
//

import UIKit

class ThemeViewController: UIViewController {

    @IBOutlet weak var darkThemeButton: UIButton!
    var darkIsOn: Bool = false
    // Marking these as optional, so the starting state can be changed from one place
    var mainText: String?
    var backgroundColor: UIColor?
    var textColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad from ViewController")
        
        // Setting this once
        darkThemeButton.layer.cornerRadius = 8
        
        // Initialize starting state based on darkIsOn variable
        mainText = getDarkModeStateText(isOn: darkIsOn)
        backgroundColor = darkIsOn ? UIColor.black : UIColor.white
        textColor = darkIsOn ? UIColor.white : UIColor.black
        
        // Set the initial view
        updateTheView()
    }

    @IBAction func darkThemeButtonTapped(_ sender: Any) {
        print("darkThemeButtonTapped")
        
        flipDarkTheme(isOn: darkIsOn)
    }
    
    func flipDarkTheme(isOn: Bool) {
        // Changing the parameters
        darkIsOn = !darkIsOn
        mainText = getDarkModeStateText(isOn: darkIsOn)
        textColor = invertColor(theColor: textColor!)
        backgroundColor = invertColor(theColor: backgroundColor!)
        
        // Update the screen
        updateTheView()
    }
    
    func updateTheView() {
        // Activating the parameters
        darkThemeButton.setTitle(mainText, for: .normal)
        darkThemeButton.setTitleColor(textColor, for: .normal)
        navigationItem.title = mainText
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key
            .foregroundColor: textColor!]
        view.backgroundColor = backgroundColor
    }
    
    // Works only with Black and White colors
    func invertColor(theColor: UIColor) -> UIColor {
        if theColor == UIColor.white {
            return UIColor.black
        } else {
            return UIColor.white
        }
    }
    
    func getDarkModeStateText(isOn: Bool) -> String {
        return "Dark theme is \(isOn ? "on" : "off")"
    }
}

