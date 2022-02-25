//
//  Coordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 15/03/22.
//

import UIKit

protocol Coordinator{

    // MARK: - Variables
    var navController : UINavigationController? { get set }
    func start()
    func finish()
    func finishtoRoot()
}
