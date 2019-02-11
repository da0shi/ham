CREATE TABLE record (
    id INT PRIMARY KEY AUTOINCREMENT,
    paid_at TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL,
    account TEXT NOT NULL,
    price INT NOT NULL,
    item TEXT NOT NULL,
    amount INT NULL,
    place TEXT NULL,
    note TEXT NULL
);
