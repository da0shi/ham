import { Injectable } from '@nestjs/common';
import { Record } from "./record.interface";

@Injectable()
export class RecordService {
	private readonly records: Record[] = [];

	create(record: Record): number {
    return this.records.push(record);
	}

	findAll(): Record[] {
		return this.records;
	}

	find(id: number): Record {
		return this.records[id - 1];
	}

	remove(id: number) {
		return this.records.splice(id - 1, 1).length === 1;
	}
}
