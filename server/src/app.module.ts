import { Module } from '@nestjs/common';
import { ReceiptController } from "./receipt/receipt.controller";
import { ReceiptService } from './receipt/receipt.service';

@Module({
  controllers: [ReceiptController],
  providers: [ReceiptService],
})
export class AppModule {}
