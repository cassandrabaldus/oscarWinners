//
//  ViewController.swift
//  oscarWinners
//
//  Created by Baldus,Cassandra R on 3/15/18.
//  Copyright © 2018 Northwest. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBAction func loadAction(_ sender: UIButton) {
        
        let movie = PFObject(className: "Movie")
        movie["title"] = "Titanic"
        movie["year"] = 1997
        movie["director"] = "James Cameron"
        
        movie.saveInBackground(block: { (success, error) -> Void in
            if !success {
                print (error as Any)
            }
        })
        
        
        let movie2 = PFObject(className: "Movie")
        movie2["title"] = "Inception"
        movie2["year"] = 2010
        movie2["director"] = "Christopher Nolan"
        
        movie2.saveInBackground(block: { (success, error) -> Void in
            if !success {
                print(error as Any)
            }
        })
        
        
        let movie3 = Movie()
        movie3.director = "Woody Allen"
        movie3.year = 1977
        movie3.title = "Annie Hall"
        
        movie3.saveInBackground(block: { (success, error) -> Void in
            if success {
                self.displayOKAlert(title: "Success!", message:"Movies saved.")
            } else {
                print(error as Any)
            }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayOKAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }

    var movies:[Movie] = [];
    @IBOutlet weak var movieTV: UITableView!
    @IBAction func fetch(sender:AnyObject) {
        let query = PFQuery(className:"Movie") // Fetches all the Movie objects
        query.findObjectsInBackground { // what happened to the ( ) ?
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                self.displayOKAlert(title: "Success!",
                                    message:"Retrieved \(objects!.count) objects.")
                self.movies = objects as! [Movie]
                // Do something with the found objects
                // Like display them in a table view.
                self.moviesTV.reloadData()
            } else {
                // Log details of the failure
                self.displayOKAlert(title: "Oops", message: “\(error!)")
            }
        }
    }
    

}

