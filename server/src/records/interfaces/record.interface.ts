export interface Record {
	readonly date: Date;
	readonly account: string;
	readonly price: number;
	readonly item: string;
	readonly amount: number;
	readonly place: string;
	readonly note: string;
}