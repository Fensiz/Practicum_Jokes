//
//  ViewController.swift
//  Jokes
//
//  Created by Симонов Иван Дмитриевич on 22.12.2024.
//

import UIKit

class JokeViewController: UIViewController {
	@IBOutlet private weak var jokeId: UILabel!
	@IBOutlet weak var jokeType: UILabel!
	@IBOutlet weak var jokeText: UILabel!
	private lazy var presenter: JokePresenter? = JokePresenter(controller: self)

	@IBAction func refresh(_ sender: UIButton) {
		presenter?.presentRandomJoke()
	}
	@IBAction func showPunchline(_ sender: UIButton) {
		presenter?.showPunchline()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.presentRandomJoke()
		// Do any additional setup after loading the view.
		
	}
	func show(joke: JokeModel) {
		DispatchQueue.main.async { [weak self] in
			self?.jokeId.text = joke.id.description
			self?.jokeType.text = joke.type
			self?.jokeText.text = joke.setup
		}
		print(joke.id)
	}

	func show(punchline: String) {
		DispatchQueue.main.async { [weak self] in
			let alert = UIAlertController(title: "Punchline", message: punchline, preferredStyle: .alert)
			let okAction = UIAlertAction(
				title: "OK",
				style: .default
			) { _ in
				print("OK нажат")
			}
			alert.addAction(okAction)

			self?.present(alert, animated: true)
		}
	}
}

