//
//  PPParticleButton.swift
//  PPParticleButtonExample
//
//  Created by HikaruSato on 2015/11/29.
//  Copyright © 2015年 HikaruSato. All rights reserved.
//

import UIKit
import SpriteKit
import QuartzCore

enum PPParticleButtonEffectType {
	case Normal
	case Selected
	case UnSelected
}

class PPParticleButton: UIButton {
	//var particleFileName:String = "starParticle"
	var particleFileNameMap:[PPParticleButtonEffectType:String] = [PPParticleButtonEffectType:String]()
	var effectParticleDuration:NSTimeInterval = 0.5

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
		addTarget(self, action: "effectParticle:", forControlEvents: UIControlEvents.TouchUpInside)
	}
	
	func effectParticle(button:UIButton) {
		guard let particleFileName = self.getParticleFileName() else {
			//Nothing particle effect
			return
		}
		let skView = SKView(frame:CGRect(
			origin:CGPoint(x: -self.frame.origin.x, y: -self.frame.origin.y),
			size: self.superview!.frame.size))
		skView.backgroundColor = UIColor.clearColor()
		skView.allowsTransparency = true
		self.addSubview(skView)
		let scene = SKScene(size: self.superview!.frame.size)
		scene.scaleMode = SKSceneScaleMode.AspectFill
		scene.backgroundColor = UIColor.clearColor()
		let particle:SKEmitterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(NSBundle.mainBundle().pathForResource(particleFileName, ofType: "sks")!) as! SKEmitterNode
		particle.position = CGPoint(x: self.center.x, y: skView.frame.size.height - self.center.y)
		skView.presentScene(scene)
		let effect = SKAction.speedTo(0, duration: self.effectParticleDuration)
		let actionBlock = SKAction.runBlock { () -> Void in
			particle.particleBirthRate = 0;
		}
		let fadeOut = SKAction()
		fadeOut.duration = 1
		let remove = SKAction.removeFromParent()
		let sequence = SKAction.sequence([effect, actionBlock, fadeOut, remove])
		particle.runAction(sequence)
		skView.scene!.addChild(particle)
		let delay = (effect.duration + fadeOut.duration) * Double(NSEC_PER_SEC)
		let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
		dispatch_after(time, dispatch_get_main_queue(), {
			skView.presentScene(nil)
			skView.removeFromSuperview()
		})
	}
	
	func getParticleFileName() -> String? {
		if let filename = particleFileNameMap[PPParticleButtonEffectType.Normal] {
			return filename
		}
		if self.selected {
			return particleFileNameMap[PPParticleButtonEffectType.Selected]
		} else {
			return particleFileNameMap[PPParticleButtonEffectType.UnSelected]
		}
	}
}
