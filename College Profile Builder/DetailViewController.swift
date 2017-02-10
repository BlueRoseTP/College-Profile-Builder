//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Reagan W. Davenport on 2/6/17.
//  Copyright © 2017 Reagan W. Davenport. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    let realm = try! Realm()

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var numberOfStudentsField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var detailItem: College? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item
        if let college = self.detailItem {
            if nameField != nil {
                nameField.text = college.name
                locationField.text = college.location
                numberOfStudentsField.text = String(college.numberOfStudents)
                imageView.image = UIImage(data: college.image)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSaveButtonTapped(_ sender: Any)
    {
        if let college = self.detailItem {
            try! realm.write(
                {
                    college.name = nameField.text!
                    college.location = locationField.text!
                    college.numberOfStudents = Int(numberOfStudentsField.text!)!
                    college.image = UIImagePNGRepresentation(imageView.image!)!
                })
        }
    }
}

