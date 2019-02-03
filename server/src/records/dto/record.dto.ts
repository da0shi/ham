export class CreateRecordDto {
	readonly date: Date;
	readonly account: string;
	readonly price: number;
	readonly item: string;
	readonly amount: number;
	readonly place: string;
	readonly note: string;
}

export class UpdateRecordDto {
	readonly date: Date;
	readonly account: string;
	readonly price: number;
	readonly item: string;
	readonly amount: number;
	readonly place: string;
	readonly note: string;	
}

export class PatchRecordDto {
	readonly date?: Date;
	readonly account?: string;
	readonly price?: number;
	readonly item?: string;
	readonly amount?: number;
	readonly place?: string;
	readonly note?: string;	
}