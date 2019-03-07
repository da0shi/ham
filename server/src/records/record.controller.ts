import { Body, Controller, Delete, Get, Param, Patch, Post, Put, Query } from "@nestjs/common";
import { RecordDto } from "./record.dto";
import { RecordService } from "./record.service";
import { Record } from "./record.interface";

@Controller("records")
export class RecordController {

  constructor(private readonly recordService: RecordService) {}

  @Post()
  create(@Body() dto: RecordDto) {
    this.recordService.create(dto);
  }

  @Get()
  findAll(@Query() query): Record[] {
    return this.recordService.findAll();
  }

  @Get(":id")
  find(@Param("id") id: number): Record {
    return this.recordService.find(id);
  }

  @Put(":id")
  update(@Param("id") id: number, @Body() dto: RecordDto) {
    return "update this record";
  }

  @Patch(":id")
  patch(@Param("id") id: number, @Body() dto: RecordDto) {
    return "update this record's that part";
  }

  @Delete(":id")
  remove(@Param("id") id: number): boolean {
    return this.recordService.remove(id);
  }
}