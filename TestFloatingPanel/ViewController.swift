//
//  ViewController.swift
//  TestFloatingPanel
//
//  Created by Anton Glezman on 04/02/2019.
//  Copyright © 2019 Anton Glezman. All rights reserved.
//

import FloatingPanel
import UIKit

class ViewController: UIViewController {

    let fpc = FloatingPanelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fpc.delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contentVC = storyboard
            .instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        fpc.set(contentViewController: contentVC)
        fpc.track(scrollView: contentVC.textView)
        fpc.addPanel(toParent: self)
    }
}


extension ViewController: FloatingPanelControllerDelegate {
    
    func floatingPanel(
        _ vc: FloatingPanelController,
        layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return self
    }
}


extension ViewController: FloatingPanelLayout {
    
    var supportedPositions: Set<FloatingPanelPosition> {
        return [.full, .half]
    }
    
    var initialPosition: FloatingPanelPosition {
        return .half
    }
    
    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
        case .full:
            return 10
        case .half:
            return 500
        default:
            return nil
        }
    }
    
    var bottomInteractionBuffer: CGFloat {
        return 500
    }
}
