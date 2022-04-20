SET @preparedStatement = (SELECT IF(
    EXISTS(
        SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS
        WHERE table_name = 'FileInfo'
        AND table_schema = DATABASE()
        AND column_name = 'ChannelId'
    ) > 0,
    'ALTER TABLE FileInfo DROP COLUMN ChannelId;',
    'SELECT 1;'
));

PREPARE removeColumnIfExists FROM @preparedStatement;
EXECUTE removeColumnIfExists;
DEALLOCATE PREPARE removeColumnIfExists;
