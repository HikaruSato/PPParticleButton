//
//  PPEffectButton.swift
//  PPEffectButtonExample
//
//  Created by HikaruSato on 2015/11/29.
//  Copyright © 2015年 HikaruSato. All rights reserved.
//

import UIKit
import SpriteKit
import QuartzCore

class PPEffectButton: UIButton {
	private var skView:SKView! = nil
	
	var particleFileName:String = "PPEffectButtonParticle"

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		createSubViews()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		createSubViews()
	}
	
	func createSubViews() {
		
		addTarget(self, action: "tapEffect:", forControlEvents: UIControlEvents.TouchUpInside)
	}
	
	func tapEffect(button:UIButton) {
		if self.skView != nil {
			return
		}

		self.skView = SKView(frame:CGRect(
			origin:CGPoint(x: -self.superview!.frame.size.width/2 + self.frame.size.width/2,
				y: -self.superview!.frame.size.height/2 + self.frame.size.height/2),
			size: self.superview!.frame.size))
		skView.backgroundColor = UIColor.clearColor()
		self.addSubview(skView)
		let scene = SKScene(size: self.superview!.frame.size)
		scene.scaleMode = SKSceneScaleMode.AspectFill
		scene.backgroundColor = UIColor.clearColor()
		let particle:SKEmitterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(NSBundle.mainBundle().pathForResource(self.particleFileName, ofType: "sks")!) as! SKEmitterNode
		particle.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
		self.skView.presentScene(scene)
		let fadeOut = SKAction.fadeOutWithDuration(1.5)
		let remove = SKAction.removeFromParent()
		let sequence = SKAction.sequence([fadeOut, remove])
		particle.runAction(sequence)
		self.skView.scene!.addChild(particle)
		let delay = 1.5 * Double(NSEC_PER_SEC)
		let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
		dispatch_after(time, dispatch_get_main_queue(), { [weak self] in
			self?.skView.presentScene(nil)
			self?.skView.removeFromSuperview()
			self?.skView = nil
		})
	}
}
