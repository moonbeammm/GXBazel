//
//  main.swift
//  universal
//
//  Created by sgx on 2020/7/31.
//

import UIKit

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    String(cString: object_getClassName(AppDelegate.self))
)
