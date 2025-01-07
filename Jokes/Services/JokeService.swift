//
//  JokeService.swift
//  Jokes
//
//  Created by Симонов Иван Дмитриевич on 23.12.2024.
//

import Foundation

final class JokeService {
	enum JokeError: Error {
		case responseError, dataCorruptedError
	}
	private let url = URL(string: "https://official-joke-api.appspot.com/jokes/random")!

	func fetchJoke(completion: @escaping (Result<JokeModel, Error>) -> Void) {
		print("fj")
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error {
				completion(.failure(error))
				print(1)
			}
			guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
				completion(.failure(JokeError.responseError))
				print(2)
				return
			}
			guard let data else {
				completion(.failure(JokeError.dataCorruptedError))
				print(3)
				return
			}
			let decoder = JSONDecoder()
			do {
				print(4)
				let model = try decoder.decode(JokeModel.self, from: data)
				completion(.success(model))
			} catch {
				completion(.failure(error))
			}
		}.resume()
	}
}
