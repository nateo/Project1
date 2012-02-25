ALTER TABLE [db_owner].[Items]
    ADD CONSTRAINT [FK_Items_Orders] FOREIGN KEY ([OrderID]) REFERENCES [db_owner].[Orders] ([OrderID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

