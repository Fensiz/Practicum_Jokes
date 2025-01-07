//
//  JokePresenter.swift
//  Jokes
//
//  Created by Симонов Иван Дмитриевич on 06.01.2025.
//

final class JokePresenter {
	private weak var controller: JokeViewController?
	private var jokeService: JokeService = JokeService()
	private var punchline: String = ""

	init(controller: JokeViewController? = nil) {
		self.controller = controller
	}

	func presentRandomJoke() {
		print("prj")
		jokeService.fetchJoke { result in
			switch result {
				case .success(let joke):
					self.controller?.show(joke: joke)
					self.punchline = joke.punchline
					print(123)
				case .failure:
					print(456)
					return
			}
		}
	}
	func showPunchline() {
		controller?.show(punchline: punchline)
	}
}
