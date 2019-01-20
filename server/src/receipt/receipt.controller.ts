import { Body, Controller, Delete, Get, Param, Patch, Post, Put, Query } from "@nestjs/common";
import { CreateReceiptDto, PatchReceiptDto, UpdateReceiptDto } from "./receipt.dto";
import { ReceiptService } from "./receipt.service";
import { Receipt } from "./receipt.interface";

@Controller("record")
export class ReceiptController {

  constructor(private readonly receiptService: ReceiptService) {}

  @Post()
  create(@Body() dto: CreateReceiptDto) {
    this.receiptService.create(dto);
  }

  @Get()
  findAll(@Query() query): Receipt[] {
    return this.receiptService.findAll();
  }

  @Get(":id")
  find(@Param("id") id: number): Receipt {
    return this.receiptService.find(id);
  }

  @Put(":id")
  update(@Param("id") id: number, @Body() dto: UpdateReceiptDto) {
    return "update this record";
  }

  @Patch(":id")
  patch(@Param("id") id: number, @Body() dto: PatchReceiptDto) {
    return "update this record's that part";
  }

  @Delete(":id")
  remove(@Param("id") id: number): boolean {
    return this.receiptService.remove(id);
  }
}