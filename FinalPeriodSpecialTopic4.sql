--FinalPeriodSpecialTopic4.sql
--結訓專題建立資料庫表格SQL程式碼
--檔案編碼格式：UTF-8檔首有BOM
--EEIT107 江慶庭組別 期末專題
--資料庫：Microsoft SQL Server 2017
--食譜功能
--作者：郭翔宇

CREATE DATABASE icook;
GO

USE icook;
GO

--留言板 table
CREATE TABLE message_board
(
	fk_recipe_id INT NOT NULL,        --食譜編號
	message_order TIMESTAMP NOT NULL, --留言時間
	message NVARCHAR(MAX) NOT NULL,   --留言內容
	FOREIGN KEY(fk_recipe_id) references recipe(pk_recipe_id)
)
GO

--食譜 table
CREATE TABLE recipe
(
	pk_recipe_id INT IDENTITY(1,1) PRIMARY KEY, --食譜編號
	recipe_name NVARCHAR(50) NOT NULL,          --食譜名稱
	recipe_quantity NVARCHAR(50) NOT NULL,      --食譜份量
	recipe_image VARBINARY(MAX) NOT NULL,       --食譜圖片
	recipe_list NVARCHAR(100) NOT NULL,         --食材
	recipe_summary NVARCHAR(100) NOT NULL,      --食譜簡介
	recipe_time NVARCHAR(30) NOT NULL,          --烹調時間
	recipe_note NVARCHAR(100),                  --小撇步介紹
	fans_id INT,                                --粉絲跟著做(粉絲帳號id)
	fans_image VARBINARY(MAX),                  --粉絲跟著做(粉絲食物圖片)
)
GO

--單元食譜 table
CREATE TABLE unit_recipe
(
	fk_recipe_id INT NOT NULL,                 --食譜編號
	recipe_step_id INT NOT NULL,               --食譜步驟編號
	recipe_step_explain NVARCHAR(50) NOT NULL, --食譜步驟說明
	recipe_step_image VARBINARY(MAX) NOT NULL, --食譜步驟圖片
	FOREIGN KEY(fk_recipe_id) references recipe(pk_recipe_id) --指定 FK
)
GO
