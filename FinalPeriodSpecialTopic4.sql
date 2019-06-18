--FinalPeriodSpecialTopic3.sql
--檔案編碼格式：UTF-8檔首有BOM
--EEIT107 江慶庭組別 期末專題
--食譜功能
--作者：郭翔宇

--CREATE DATABASE DB03;
--GO

--USE DB03;
--GO

CREATE DATABASE f_project;
GO

USE f_project;
GO

--會員資料 tbale
CREATE TABLE member_inf
(
	member_id INT IDENTITY(1,1) PRIMARY KEY, --會員編號
	member_email VARCHAR(MAX) NOT NULL,      --電子郵件
	password VARCHAR(MAX) NOT NULL,          --密碼
	nickname VARCHAR(30) NOT NULL unique,    --暱稱
	member_photo VARBINARY(MAX) NOT NULL,    --大頭貼
	tracked_num INT NOT NULL,                --被追蹤數
	recipe_num INT NOT NULL,                 --發表食譜數量
	cover_photo VARBINARY(MAX) NOT NULL,     --封面圖片
	register_date DATE NOT NULL              --註冊時間
)
GO

/*
--留言板 table
CREATE TABLE message_board
(
	fk_member_id INT NOT NULL FOREIGN KEY REFERENCES member_inf(member_id), --FK會員編號
	message_order TIMESTAMP NOT NULL,                                       --FK留言時間
	message NVARCHAR(MAX) NOT NULL                                          --FK留言內容
)
GO
*/

--留言板 table
CREATE TABLE message_board
(
	fk_member_id INT NOT NULL,        --FK會員編號
	message_order TIMESTAMP NOT NULL, --留言時間
	message NVARCHAR(MAX) NOT NULL,   --留言內容
	FOREIGN KEY(fk_member_id) references member_inf(member_id)
)
GO

--食譜 table
CREATE TABLE recipe
(
	fk_member_id INT NOT NULL,             --FK會員編號
	recipe_id INT NOT NULL,                --食譜編號
	recipe_name NVARCHAR(50) NOT NULL,     --食譜名稱
	recipe_quantity NVARCHAR(50) NOT NULL, --食譜份量
	recipe_image VARBINARY(MAX) NOT NULL,  --食譜圖片
	recipe_list NVARCHAR(100) NOT NULL,    --食材
	recipe_summary NVARCHAR(100) NOT NULL, --食譜簡介
	recipe_time NVARCHAR(30) NOT NULL,     --烹調時間
	recipe_note NVARCHAR(100),             --小撇步介紹
	fans_id INT,                           --粉絲跟著做(粉絲帳號id)
	fans_image VARBINARY(MAX),             --粉絲跟著做(粉絲食物圖片)
	FOREIGN KEY(fk_member_id) references member_inf(member_id) --指定 FK
)
GO

--單元食譜 table
CREATE TABLE unit_recipe
(
	fk_member_id INT NOT NULL,                 --FK會員編號
	recipe_id INT NOT NULL,                    --食譜編號
	recipe_step_id INT NOT NULL,               --食譜步驟編號
	recipe_step_explain NVARCHAR(50) NOT NULL, --食譜步驟說明
	recipe_step_image VARBINARY(MAX) NOT NULL, --食譜步驟圖片
	FOREIGN KEY(fk_member_id) references member_inf(member_id) --指定 FK
)
GO