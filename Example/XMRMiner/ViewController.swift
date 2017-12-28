//
//  ViewController.swift
//  XMRMiner
//
//  Created by nickplee on 10/09/2017.
//  Copyright (c) 2017 nickplee. All rights reserved.
//

import UIKit
import XMRMiner

class ViewController: UIViewController {
    @IBOutlet weak var hashrateLabel: UILabel!
    @IBOutlet weak var submittedHashesLabel: UILabel!
}

extension ViewController: MinerDelegate {
    func miner(failedSubmission hash: Data, error: Error) {
        let base64 = hash.base64EncodedString()
        print("failed submitting \"\(base64)\": \(error.localizedDescription)")
    }
    
    func miner(updatedStats stats: MinerStats) {
        hashrateLabel.text = "\(stats.hashRate) H/s"
        submittedHashesLabel.text = "\(stats.submittedHashes)"
    }
    
    
}
