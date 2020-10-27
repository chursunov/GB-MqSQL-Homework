-- таблица гости
CREATE TABLE guests (
	user_id BIGINT UNSIGNED NOT NULL,
	guested_at DATETIME DEFAULT NOW(),
	guest_user_id BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (user_id, guest_user_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (guest_user_id) REFERENCES users(id),
	CHECK(user_id != guest_user_id)
	);

-- таблица сторис
CREATE TABLE stories (
	user_id BIGINT UNSIGNED NOT NULL,
	viewed_user_id BIGINT UNSIGNED NOT NULL,
	filename VARCHAR(255),
	media_type ENUM('image', 'video'),
	body TEXT,
	created_at DATETIME DEFAULT NOW(), -- потом пробегаемся по таблице и удаляем сторис по заданному интервалу
	
	PRIMARY KEY (user_id, viewed_user_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (viewed_user_id) REFERENCES users(id),
	CHECK(user_id != viewed_user_id)
);

-- игры
CREATE TABLE games (
	id SERIAL,
	name VARCHAR(200),
	creator_user_id BIGINT UNSIGNED NOT NULL,
	
	INDEX(name),
	FOREIGN KEY (creator_user_id) REFERENCES users(id)
);

CREATE TABLE players_game (
	user_id BIGINT UNSIGNED NOT NULL,
	game_id BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (user_id, game_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (game_id) REFERENCES games(id)
);