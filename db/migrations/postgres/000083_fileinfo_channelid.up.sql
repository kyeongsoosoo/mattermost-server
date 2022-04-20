ALTER TABLE fileinfo ADD COLUMN IF NOT EXISTS channelid varchar(26);
UPDATE fileinfo SET channelid = posts.channelid FROM posts WHERE fileinfo.channelid IS NULL AND fileinfo.postid = posts.id;
