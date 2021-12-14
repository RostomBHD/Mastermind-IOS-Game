//
//  Result.swift
//  MASTERMIND
//
//  Created by Benhamada, Rostom on 16/11/2021.
//  Copyright © 2021 Benhamada, Rostom. All rights reserved.
//

import UIKit

class Result: UIViewController {
    
    override func viewDidLoad() {  // everytime this page opens means that the player won , so we update the won games 
        super.viewDidLoad()
        wongames += 1
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
