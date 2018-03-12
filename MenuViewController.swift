//
//  MenuViewController.swift
//  Quiz
//
//  Created by Eric Bousbaa on 08.03.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var gameMode: UIPickerView!
    
    var pickerData = ["White", "Red", "Green", "Blue"];
    var selectedItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.setTitle("Jouer !", for: .normal)
        
        
        self.gameMode.dataSource = self;
        self.gameMode.delegate = self;
    }
    
    
    func numberOfComponents(in pickerChooseGame: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        selectedItem = row
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartGameSession(_ sender: Any) {
        print("Lets play");
        // var selectedValue = gameMode[pickerView.selectedRowInComponent(0)]
        
        
        let viewController = storyboard!.instantiateViewController(withIdentifier: "GameID") as! ViewController
        viewController.gameMode = "NinjaQuizSession"
        
        self.present(viewController as UIViewController, animated: false, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
