import { Module, NestModule, MiddlewareConsumer } from '@nestjs/common';
import { RecordModule } from './records/record.module';
import { LoggerMiddleware } from './common/middlewares/logger.middleware';
import { RecordController } from './records/record.controller';

@Module({
  imports: [RecordModule],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(LoggerMiddleware)
      .forRoutes(RecordController);
  }
}
