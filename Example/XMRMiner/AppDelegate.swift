//
//  AppDelegate.swift
//  XMRMiner
//
//  Created by nickplee on 10/09/2017.
//  Copyright (c) 2017 nickplee. All rights reserved.
//

import UIKit
import XMRMiner

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let miner = Miner(destinationAddress: "43c5NQn6xBMEEj1ys5SaSQA3CMVcqZ8LNiv9zeWm16hH2sc817VtMLqAefK6A9knvY5FVuxtF21wzhvUoKCmY6QuA5gHjJK")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        miner.delegate = window?.rootViewController as? MinerDelegate
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        miner.stop()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        do {
            try miner.start()
        }
        catch {
            print("something bad happened")
        }
    }
    
}

