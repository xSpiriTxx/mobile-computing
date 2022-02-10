//
//  ViewController.swift
//  game
//
//  Created by Matthias Gassner on 10.02.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var monkey: UIImageView!
    
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
        // 1
        let translation = gesture.translation(in: view)

        // 2
        guard let gestureView = gesture.view else {
        return
        }

        gestureView.center = CGPoint(
        x: gestureView.center.x + translation.x,
        y: gestureView.center.y + translation.y
        )

        // 3
        gesture.setTranslation(.zero, in: view)
        
        if(banana.frame.intersects(monkey.frame)){
            banana.image = UIImage(named: "banana_peeled.jpg");
        }
        
    }
    
    @IBAction func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let gestureView = gesture.view else {
          return
        }

        gestureView.transform = gestureView.transform.scaledBy(
          x: gesture.scale,
          y: gesture.scale
        )
        gesture.scale = 1
        
        if(banana.frame.intersects(monkey.frame)){
            banana.image = UIImage(named: "banana_peeled.jpg");
        }
    }
    
    @IBAction func handleRotate(_ gesture: UIRotationGestureRecognizer) {
        guard let gestureView = gesture.view else {
          return
        }

        gestureView.transform = gestureView.transform.rotated(
          by: gesture.rotation
        )
        gesture.rotation = 0
        
        if(banana.frame.intersects(monkey.frame)){
            banana.image = UIImage(named: "banana_peeled.jpg");
        }
    }

}
extension ViewController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith  otherGestureRecognizer: UIGestureRecognizer) -> Bool {
      return true
    }
}
