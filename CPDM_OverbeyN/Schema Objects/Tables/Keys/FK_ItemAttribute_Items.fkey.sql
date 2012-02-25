ALTER TABLE [db_owner].[ItemAttribute]
    ADD CONSTRAINT [FK_ItemAttribute_Items] FOREIGN KEY ([ItemID]) REFERENCES [db_owner].[Items] ([ItemID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

