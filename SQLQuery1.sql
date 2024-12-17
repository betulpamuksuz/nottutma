ALTER TABLE favoriler
ADD CONSTRAINT FK_not_favoriler FOREIGN KEY (not_id) REFERENCES notlar(id);
