//
//  JokeModel.swift
//  Jokes
//
//  Created by Симонов Иван Дмитриевич on 23.12.2024.
//

struct JokeModel: Codable {
	let type, setup, punchline: String
	let id: Int
}
