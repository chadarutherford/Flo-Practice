//
// H20ConsumptionViewController.swift
// Flo-Practice
//
// Created by Chad Rutherford on 7/24/20.
// Copyright © 2020 chadarutherford. All rights reserved.
//

import SwiftUI
import UIKit

class H20ConsumptionViewController: UIViewController {
	
	let plusButton: PushButton = {
		let button = PushButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(pushButtonPressed(_:)), for: .touchUpInside)
		button.fillColor = UIColor(red: 87 / 255, green: 218 / 255, blue: 213 / 255, alpha: 1)
		return button
	}()
	
	let minusButton: PushButton = {
		let button = PushButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(pushButtonPressed(_:)), for: .touchUpInside)
		button.isAddButton = false
		button.fillColor = UIColor(red: 238 / 255, green: 77 / 255, blue: 77 / 255, alpha: 1)
		return button
	}()
	
	let counterView: CounterView = {
		let view = CounterView()
		view.backgroundColor = .systemBackground
		view.translatesAutoresizingMaskIntoConstraints = false
		view.counterColor = UIColor(red: 87 / 255, green: 218 / 255, blue: 213 / 255, alpha: 1)
		view.outlineColor = UIColor(red: 34 / 255, green: 110 / 255, blue: 100 / 255, alpha: 1)
		return view
	}()
	
	let counterLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 36)
		label.text = "8"
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		counterLabel.text = "\(counterView.counter)"
		layoutUI()
	}
	
	private func layoutUI() {
		view.backgroundColor = .systemBackground
		view.addSubview(counterView)
		view.addSubview(plusButton)
		view.addSubview(minusButton)
		counterView.addSubview(counterLabel)
		
		NSLayoutConstraint.activate([
			counterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			counterView.bottomAnchor.constraint(equalTo: plusButton.topAnchor, constant: -40),
			counterView.widthAnchor.constraint(equalToConstant: 230),
			counterView.heightAnchor.constraint(equalTo: counterView.widthAnchor, multiplier: 1),
			
			counterLabel.centerXAnchor.constraint(equalTo: counterView.centerXAnchor),
			counterLabel.centerYAnchor.constraint(equalTo: counterView.centerYAnchor),
			
			plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
			plusButton.widthAnchor.constraint(equalToConstant: 100),
			plusButton.heightAnchor.constraint(equalToConstant: 100),
			
			minusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			minusButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 20),
			minusButton.widthAnchor.constraint(equalToConstant: 50),
			minusButton.heightAnchor.constraint(equalTo: minusButton.widthAnchor, multiplier: 1)
		])
	}
	
	@objc private func pushButtonPressed(_ sender: PushButton) {
		if sender.isAddButton {
			counterView.counter += 1
		} else {
			if counterView.counter > 0 {
				counterView.counter -= 1
			}
		}
		counterLabel.text = "\(counterView.counter)"
	}
}

struct H20ConsumptionPreview: PreviewProvider {
	static var previews: some View {
		ContainerView()
	}
	
	struct ContainerView: UIViewControllerRepresentable {
		func updateUIViewController(_ uiViewController: H20ConsumptionPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<H20ConsumptionPreview.ContainerView>) {
			
		}
		
		func makeUIViewController(context: UIViewControllerRepresentableContext<H20ConsumptionPreview.ContainerView>) -> UIViewController {
			return H20ConsumptionViewController()
		}
	}
}
