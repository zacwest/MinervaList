//
//  LoadingHUD.swift
//  MinervaExample
//
//  Copyright © 2019 Optimize Fitness, Inc. All rights reserved.
//

import Foundation
import UIKit

import MBProgressHUD

public enum LoadingHUD {
	public static func update(in view: UIView?, visible: Bool) {
		if visible {
			LoadingHUD.show(in: view)
		} else {
			LoadingHUD.hide(from: view)
		}
	}
	public static func show(in view: UIView?) {
		LoadingHUD.show(in: view, withGraceTime: 0)
	}
	public static func hide(from view: UIView?) {
		guard let view = view else {
			return
		}
		MBProgressHUD.hide(for: view, animated: true)
	}
	public static func show(in view: UIView?, withGraceTime graceTime: TimeInterval) {
		guard let view = view, MBProgressHUD(for: view) == nil else {
			return
		}
		let hud = MBProgressHUD(view: view)
		hud.graceTime = graceTime
		hud.minShowTime = 0.25
		view.addSubview(hud)
		hud.show(animated: true)
	}
}
