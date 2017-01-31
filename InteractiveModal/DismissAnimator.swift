//
//  DismissAnimator.swift
//  InteractiveModal
//
//  Created by keisei_1092 on 2017/1/31.
//  Copyright © 2017年 Thorn Technologies. All rights reserved.
//

import UIKit

class DismissAnimator: NSObject {

}

extension DismissAnimator: UIViewControllerAnimatedTransitioning {

	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 0.6
	}

	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard
			let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
			let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
		else {
			return
		}

		transitionContext.containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)

		let screenBounds = UIScreen.main.bounds
		let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)
		let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)

		UIView.animate(
			withDuration: transitionDuration(using: transitionContext), animations: {
			fromViewController.view.frame = finalFrame
		}, completion: { _ in
			transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
		})
	}

}
