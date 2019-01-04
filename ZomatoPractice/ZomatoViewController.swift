//
//  ZomatoViewController.swift
//  ZomatoPractice
//
//  Created by iOS Training on 12/15/18.
//  Copyright © 2018 iOS Training. All rights reserved.
//

import UIKit
let API_URL = "https://developers.zomato.com/api/v2.1/dailymenu?res_id=16507622"

class ZomatoViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func helloWorld(_ sender: Any) {
        self.hitAPI()
        label.text = "Hello"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   

}
    
    
    extension ZomatoViewController {
        
        private func hitAPI() {
            //1
            if let url = URL.init(string: API_URL) {
                var urlRequest = URLRequest.init(url: url)
                urlRequest.httpMethod = "GET"
                urlRequest.allHTTPHeaderFields = ["content-type" : "application/json"]
                //2
                let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                    
                    DispatchQueue.main.async {
                        
                    }
                    
                    //Handle The Response
                    if let anyErrorObj = error {
                        print("Error Occured - \(anyErrorObj)")
                        return
                    }
                    
                    guard let dataObject = data else {
                        return
                    }
                    
                    if let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200 {
                        
                        let responseString = String.init(data: dataObject, encoding: String.Encoding.utf8)
                        print("Hey we got the response -- \n  \(String(describing: responseString))")
                    }
                }
                dataTask.resume()
            }
        }
    }

