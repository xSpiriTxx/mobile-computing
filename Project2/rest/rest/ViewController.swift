//
//  ViewController.swift
//  rest
//
//  Created by Matthias Gassner on 09.12.21.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var imageView: UIImageView!
    let queue = DispatchQueue(label: "Sidethread");
    let link2 = "https://lifetimemix.com/wp-content/uploads/2021/06/1800x1200_cat_relaxing_on_patio_other.jpg"
    let link = "https://jsonplaceholder.typicode.com/todos"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demo()
    }
    
    func download(){
        if let url = URL(string: link) {
            if let data = try? Data(contentsOf: url) {
                print("loaded \(data)")
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []){
                    if let array = jsonObject as? [[String: Any]]{
                        for obj in array {
                            if let title = obj["title"]{
                                print("loaded \(title)")
                            }
                        }
                    }
                }else{
                    print("failed to parse json")
                }
            } else {
                print("failed to load data")
            }
        } else {
            print("invalid url")
        }
        
    }
    
    func demo(){
        queue.async {
            self.download()
            DispatchQueue.main.async {
                
            }
        }
    }
    
    
    
    /*func demo2(){
        let url = URL(string: link2)!
        
        queue.async {
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data!)
            print("data loaded \(data)")
            Thread.sleep(forTimeInterval: 5)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }*/


}

