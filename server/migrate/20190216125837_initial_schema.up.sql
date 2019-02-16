CREATE TABLE cash_flow (
    id INT PRIMARY KEY AUTOINCREMENT,
	inout INT DEFAULT 0 NOT NULL COMMENT '0 as income, 1 as outgo',
    moved_at TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL,
    account TEXT NOT NULL,
    amount INT NOT NULL COMMENT 'How much money have moved',
    item TEXT NOT NULL COMMENT 'Kind like a category',
    place TEXT NULL COMMENT 'Place where you bought',
    note_json TEXT NULL COMMENT 'Note in json format'
);

