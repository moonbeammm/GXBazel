//
//  HomeViewController.swift
//  _idx_gxhome_library_007755E5_ios_min9.0
//
//  Created by sgx on 2020/8/24.
//

import UIKit

public class HomeViewController: UIViewController {
    public override func viewDidLoad() {
        self.view.backgroundColor = UIColor.red
    }
}

extension HomeViewController {
    public override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear!")
    }
}
