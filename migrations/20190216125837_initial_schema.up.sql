CREATE TABLE cash_flow (
    id INT PRIMARY KEY AUTOINCREMENT,
	inout INT DEFAULT 0 NOT NULL COMMENT '0 as income, 1 as outgo',
    moved_at TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL,
    account TEXT NOT NULL '',
    amount INT NOT NULL COMMENT 'an amount of money that has moved',
    item TEXT NOT NULL COMMENT 'kind like a category',
    place TEXT NULL COMMENT 'place where spend money',
    note_json TEXT NULL COMMENT 'note in json format'
);
