export class CreateReceiptDto {
	readonly date: Date;
	readonly account: string;
	readonly price: number;
	readonly item: string;
	readonly amount: number;
	readonly place: string;
	readonly note: string;
}

export class UpdateReceiptDto {
	readonly date: Date;
	readonly account: string;
	readonly price: number;
	readonly item: string;
	readonly amount: number;
	readonly place: string;
	readonly note: string;	
}

export class PatchReceiptDto {
	readonly date?: Date;
	readonly account?: string;
	readonly price?: number;
	readonly item?: string;
	readonly amount?: number;
	readonly place?: string;
	readonly note?: string;	
}