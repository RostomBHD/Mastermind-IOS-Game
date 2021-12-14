//
//  SecondViewController.swift
//  MASTERMIND
//
//  Created by Benhamada, Rostom on 05/11/2021.
//  Copyright © 2021 Benhamada, Rostom. All rights reserved.
//

import UIKit




class SecondViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var UserTable: UITableView!
    
    let colorsarray = ["green","grey","red","yellow","blue","orange"]
    
    var selectedcolors = [String]()
    
    var UserGuess = [[String]]()
    
    var randomcolors = [String]()
    
    var theSecretCode = [String]()
    
    
    
    @IBAction func green(_ sender: Any)  {
        let color = "green"
        selectedcolors.append(color)
    }
    
    
    @IBAction func grey(_ sender: Any) {
        let color = "grey"
        selectedcolors.append(color)
    }
    
    
    @IBAction func red(_ sender: Any) {
        let color = "red"
        selectedcolors.append(color)
    }
    
    
    @IBAction func yellow(_ sender: Any) {
        let color = "yellow"
        selectedcolors.append(color)
    }
    
    
    @IBAction func blue(_ sender: Any) {
        let color = "blue"
        selectedcolors.append(color)
    }
    
    
    @IBAction func orange(_ sender: Any) {
        let color = "orange"
        selectedcolors.append(color)
    }
    
   

    
    var feedback = [[String]]()
     
    @IBAction func submitedcolors(_ sender: Any)  {
        UserGuess.append(selectedcolors)
        UserTable.reloadData()
        var temporaryfeedback = [String]()
        var exactMatchCount = 0
        var partialMatchCount = 0
        var workingCopy = theSecretCode
        var myGuess = selectedcolors
        for j in 0 ... 3 { //looking for exact matches
            if workingCopy[j] ==  myGuess[j] { //is the colour in the same position in both arrays?
                exactMatchCount += 1
                workingCopy[j] = "++" //now cannot match with another code
                myGuess[j] = "=="
                temporaryfeedback.append("black blob")
            }
                
        }
        
           for j in 0 ... 3 { //looking for partial matches
               for k in 0 ... 3 {
                    if j != k {
                        if workingCopy[j] ==  myGuess[k] {
                            partialMatchCount += 1
                            workingCopy[j] = "++"
                            temporaryfeedback.append("white blob")
                           break
                    }
                        
                }
            }
        }

        
        while temporaryfeedback.count < 4  {
            temporaryfeedback.append("nil")
        }
        
        feedback.append(temporaryfeedback) // feedback is 2d array , contains feedback of each cell that get updated 
        print(theSecretCode)
        print(selectedcolors)
        print(temporaryfeedback)
        print(feedback)
        selectedcolors.removeAll()
        temporaryfeedback.removeAll()
        wingame()
        
    }
 
    
    
    
    @IBAction func deleteselection(_ sender: Any) {
        selectedcolors.removeAll()
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserGuess.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell   {
       let mycell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! MastermindTableViewCell
       mycell.FirstColor.image = UIImage(named: UserGuess[indexPath.row][0] )
       mycell.SecondColor.image = UIImage (named: UserGuess[indexPath.row][1])
       mycell.ThirdColor.image = UIImage (named: UserGuess[indexPath.row][2])
       mycell.FourthColor.image = UIImage (named: UserGuess[indexPath.row][3])
            
        
        mycell.feedback1?.image = UIImage (named: feedback [indexPath.row][0])
        mycell.feedback2?.image = UIImage (named: feedback[indexPath.row][1])
        mycell.feedback3?.image = UIImage (named: feedback[indexPath.row][2])
        mycell.feedback4?.image = UIImage (named: feedback[indexPath.row][3])
                
               
       return mycell
   }
    
    func wingame () -> Int {    //game finishes when all feedback are black
      var win = false
        for x in feedback {
            if x.allSatisfy({ $0 == "black blob" }) { // we check if every element of the arary feedback is black
                win = true
                performSegue(withIdentifier:"finish" , sender: nil) //to send the player to the last screen that tells him that he won
            }
        }
        print(win) // to check in the terminal if the player actually won
      return wongames
    }

     

    override func viewDidLoad() {
        super.viewDidLoad()
        theSecretCode =  Array(Set(colorsarray).prefix(4))

        
    }
    
}
 

