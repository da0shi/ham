import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class RecordDto {
	@PrimaryGeneratedColumn()
	readonly id: number;
	@Column()
	readonly paidAt: Date;
	@Column()
	readonly account: string;
	@Column()
	readonly price: number;
	@Column()
	readonly item: string;
	@Column()
	readonly amount: number;
	@Column()
	readonly place: string;
	@Column()
	readonly note: string;
}
