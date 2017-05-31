//
//  ViewController.swift
//  PPParticleButtonExample
//
//  Created by HikaruSato on 2016/01/17.
//  Copyright © 2016年 HikaruSato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var starBtn: PPParticleButton!
	@IBOutlet weak var heartBtn: PPParticleButton!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		starBtn.particleFileNameMap[PPParticleButtonEffectType.normal] = "StarParticle"
		heartBtn.particleFileNameMap[PPParticleButtonEffectType.unSelected] = "HeartParticle"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	@IBAction func tapStarBtn(_ sender: AnyObject) {
	}
	
	@IBAction func tapHeartBtn(_ sender: AnyObject) {
		heartBtn.isSelected = !heartBtn.isSelected
	}
	

}

