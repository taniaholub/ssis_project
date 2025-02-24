
USE AdventureWorksDW2016;

SELECT * FROM DimAccount;
SELECT * FROM DimCurrency;


USE Adventure;
GO
DROP TABLE IF EXISTS [dbo].[DimAccount_Destination]
CREATE TABLE [dbo].[DimAccount_Destination] (
    AccountKey INT PRIMARY KEY,
    ParentAccountKey INT NULL,
    AccountCodeAlternateKey INT NULL,
    ParentAccountCodeAlternateKey INT NULL,
    AccountDescription NVARCHAR(50) NULL,
    AccountType NVARCHAR(50) NULL,
    Operator NVARCHAR(50) NULL,
    CustomMembers NVARCHAR(300) NULL,
    ValueType NVARCHAR(50) NULL,
    CustomMemberOptions NVARCHAR(200) NULL,
    -- Додаткові колонки для SSIS
    UserName NVARCHAR(50) NULL,
    ExecutionDate DATETIME NULL
);

DROP TABLE IF EXISTS [dbo].[DimCurrency_Destination]
-- Table for matched rows
CREATE TABLE [dbo].[DimCurrency_Destination] (
    CurrencyKey INT PRIMARY KEY NOT NULL,
    CurrencyAlternateKey NCHAR(3) NOT NULL,
    CurrencyName NVARCHAR(50) NOT NULL,
    MatchStatus NVARCHAR(20) NOT NULL DEFAULT 'Matched',
    InsertedDate DATETIME DEFAULT GETDATE()
);

DROP TABLE IF EXISTS [dbo].[DimCurrency_NotMatched]
-- Table for not matched rows
CREATE TABLE [dbo].[DimCurrency_NotMatched] (
    CurrencyKey INT PRIMARY KEY NOT NULL,
    CurrencyAlternateKey NCHAR(3) NOT NULL,
    CurrencyName NVARCHAR(50) NOT NULL,
    Reason NVARCHAR(255) NULL,
    InsertedDate DATETIME DEFAULT GETDATE()
);


SELECT * FROM DimAccount_Destination;

SELECT * FROM DimCurrency_Destination;

SELECT * FROM DimCurrency_NotMatched;