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
	
	let containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		view.isUserInteractionEnabled = true
		return view
	}()
	
	let counterView: CounterView = {
		let view = CounterView()
		view.backgroundColor = .clear
		view.translatesAutoresizingMaskIntoConstraints = false
		view.isUserInteractionEnabled = true
		view.counterColor = UIColor(red: 87 / 255, green: 218 / 255, blue: 213 / 255, alpha: 1)
		view.outlineColor = UIColor(red: 34 / 255, green: 110 / 255, blue: 100 / 255, alpha: 1)
		return view
	}()
	
	let graphView: GraphView = {
		let graph = GraphView()
		graph.isUserInteractionEnabled = true
		graph.translatesAutoresizingMaskIntoConstraints = false
		graph.backgroundColor = .clear
		graph.startColor = UIColor(red: 250 / 255, green: 233 / 255, blue: 222 / 255, alpha: 1)
		graph.endColor = UIColor(red: 252 / 255, green: 79 / 255, blue: 8 / 255, alpha: 1)
		return graph
	}()
	
	let counterLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 36)
		label.text = "8"
		return label
	}()
	
	let stack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .horizontal
		stack.alignment = .fill
		stack.distribution = .fillEqually
		stack.spacing = 0
		stack.contentMode = .scaleToFill
		stack.autoresizesSubviews = true
		return stack
	}()
	
	let waterDrankLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Water Drank"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
		label.textColor = .white
		return label
	}()
	
	let averageLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Average:"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let averageWaterDrankLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "2"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let maxLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "99"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let minLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "0"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let day1Label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "M"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let day2Label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "M"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let day3Label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "M"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let day4Label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "M"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let day5Label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "M"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let day6Label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "M"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	let day7Label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "M"
		label.font = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
		label.textColor = .white
		return label
	}()
	
	var isGraphViewShowing = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		counterLabel.text = "\(counterView.counter)"
		layoutUI()
	}
	
	private func layoutUI() {
		view.backgroundColor = .systemBackground
		view.addSubview(containerView)
		containerView.addSubview(counterView)
		containerView.addSubview(graphView)
		view.addSubview(plusButton)
		view.addSubview(minusButton)
		counterView.addSubview(counterLabel)
		graphView.addSubview(waterDrankLabel)
		graphView.addSubview(averageLabel)
		graphView.addSubview(averageWaterDrankLabel)
		graphView.addSubview(maxLabel)
		graphView.addSubview(minLabel)
		graphView.addSubview(stack)
		let views = [day1Label, day2Label, day3Label, day4Label, day5Label, day6Label, day7Label]
		for view in views {
			stack.addArrangedSubview(view)
		}
		
		let gesture = UITapGestureRecognizer(target: self, action: #selector(H20ConsumptionViewController.containerViewTapped(_:)))
		containerView.addGestureRecognizer(gesture)
		
		NSLayoutConstraint.activate([
			containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
			containerView.widthAnchor.constraint(equalToConstant: 300),
			containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1),
			
			counterView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
			counterView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			counterView.widthAnchor.constraint(equalToConstant: 230),
			counterView.heightAnchor.constraint(equalTo: counterView.widthAnchor, multiplier: 1),
			
			counterLabel.centerXAnchor.constraint(equalTo: counterView.centerXAnchor),
			counterLabel.centerYAnchor.constraint(equalTo: counterView.centerYAnchor),
			
			graphView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
			graphView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			graphView.widthAnchor.constraint(equalToConstant: 300),
			graphView.heightAnchor.constraint(equalToConstant: 250),
			
			plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
			plusButton.widthAnchor.constraint(equalToConstant: 100),
			plusButton.heightAnchor.constraint(equalToConstant: 100),
			
			minusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			minusButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 20),
			minusButton.widthAnchor.constraint(equalToConstant: 50),
			minusButton.heightAnchor.constraint(equalTo: minusButton.widthAnchor, multiplier: 1),
			
			waterDrankLabel.trailingAnchor.constraint(greaterThanOrEqualTo: graphView.trailingAnchor, constant: -200),
			waterDrankLabel.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 8),
			waterDrankLabel.topAnchor.constraint(equalTo: graphView.topAnchor, constant: 8),
			waterDrankLabel.heightAnchor.constraint(equalToConstant: 21),
			
			averageLabel.topAnchor.constraint(equalTo: waterDrankLabel.bottomAnchor, constant: 3),
			averageLabel.heightAnchor.constraint(equalToConstant: 24),
			averageLabel.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 8),
			
			averageWaterDrankLabel.widthAnchor.constraint(equalToConstant: 15),
			averageWaterDrankLabel.leadingAnchor.constraint(equalTo: averageLabel.trailingAnchor, constant: 3),
			averageWaterDrankLabel.heightAnchor.constraint(equalToConstant: 24),
			averageWaterDrankLabel.topAnchor.constraint(equalTo: waterDrankLabel.bottomAnchor, constant: 3),
			
			maxLabel.trailingAnchor.constraint(equalTo: graphView.trailingAnchor, constant: -8),
			maxLabel.leadingAnchor.constraint(greaterThanOrEqualTo: averageWaterDrankLabel.trailingAnchor, constant: 120),
			maxLabel.topAnchor.constraint(equalTo: graphView.topAnchor, constant: 49),
			maxLabel.heightAnchor.constraint(equalToConstant: 21),
			
			minLabel.trailingAnchor.constraint(equalTo: graphView.trailingAnchor, constant: -8),
			minLabel.leadingAnchor.constraint(greaterThanOrEqualTo: graphView.leadingAnchor, constant: 250),
			minLabel.heightAnchor.constraint(equalToConstant: 21),
			minLabel.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -4),
			
			stack.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 20),
			stack.trailingAnchor.constraint(equalTo: graphView.trailingAnchor),
			stack.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
			stack.heightAnchor.constraint(equalToConstant: 25)
		])
		UIView.transition(from: graphView,
						  to: counterView,
						  duration: 1.0,
						  options: [.transitionFlipFromLeft, .showHideTransitionViews])
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
		if isGraphViewShowing {
			containerViewTapped(nil)
		}
	}
	
	private func setupGraphDisplay() {
		let maxDayIndex = stack.arrangedSubviews.count - 1
		
		graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
		graphView.setNeedsDisplay()
		maxLabel.text = "\(graphView.graphPoints.max() ?? 0)"
		
		let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
		averageWaterDrankLabel.text = "\(average)"
		
		let today = Date()
		let calendar = Calendar.current
		
		let formatter = DateFormatter()
		formatter.setLocalizedDateFormatFromTemplate("EEEEE")
		
		for i in 0 ... maxDayIndex {
			if let date = calendar.date(byAdding: .day, value: -i, to: today),
			   let label = stack.arrangedSubviews[maxDayIndex - i] as? UILabel {
				label.text = formatter.string(from: date)
			}
		}
	}
	
	@objc private func containerViewTapped(_ gesture: UITapGestureRecognizer?) {
		if isGraphViewShowing {
			UIView.transition(from: graphView,
							  to: counterView,
							  duration: 1.0,
							  options: [.transitionFlipFromLeft, .showHideTransitionViews])
		} else {
			UIView.transition(from: counterView,
							  to: graphView,
							  duration: 1.0,
							  options: [.transitionFlipFromRight, .showHideTransitionViews])
			setupGraphDisplay()
		}
		isGraphViewShowing.toggle()
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
