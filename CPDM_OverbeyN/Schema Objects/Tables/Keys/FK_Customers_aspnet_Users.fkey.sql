ALTER TABLE [db_owner].[Customers]
    ADD CONSTRAINT [FK_Customers_aspnet_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

