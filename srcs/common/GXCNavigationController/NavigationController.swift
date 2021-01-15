//
//  NavigationController.swift
//  _idx_gxcnavigation_library_DB5CCEBD_ios_min9.0
//
//  Created by sgx on 2020/8/25.
//

import UIKit

public class NavigationController : UINavigationController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print("NavigationController viewDidLoad!")
        
        self.view.backgroundColor = UIColor.red
    }
    
    public override var shouldAutorotate: Bool {
        return topViewController?.shouldAutorotate ?? true
    }

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .allButUpsideDown
    }

    public override var prefersStatusBarHidden: Bool {
        return topViewController?.prefersStatusBarHidden ?? false
    }

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? UIStatusBarStyle.lightContent
    }
    
    
}
