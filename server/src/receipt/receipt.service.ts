import { Injectable } from '@nestjs/common';
import { Receipt } from "./receipt.interface";

@Injectable()
export class ReceiptService {
	private readonly receipts: Receipt[] = [];

	create(receipt: Receipt): number {
    return this.receipts.push(receipt);
	}

	findAll(): Receipt[] {
		return this.receipts;
	}

	find(id: number): Receipt {
		return this.receipts[id - 1];
	}

	remove(id: number) {
		return this.receipts.splice(id - 1, 1).length === 1;
	}
}
