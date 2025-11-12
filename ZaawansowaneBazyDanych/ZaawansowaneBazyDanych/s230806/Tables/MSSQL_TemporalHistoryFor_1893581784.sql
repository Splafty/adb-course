CREATE TABLE [s230806].[MSSQL_TemporalHistoryFor_1893581784] (
    [CustomerID]   INT               NOT NULL,
    [NameStyle]    [dbo].[NameStyle] NOT NULL,
    [Title]        NVARCHAR (8)      NULL,
    [FirstName]    [dbo].[Name]      NOT NULL,
    [MiddleName]   [dbo].[Name]      NULL,
    [LastName]     [dbo].[Name]      NOT NULL,
    [Suffix]       NVARCHAR (10)     NULL,
    [CompanyName]  NVARCHAR (128)    NULL,
    [SalesPerson]  NVARCHAR (256)    NULL,
    [EmailAddress] NVARCHAR (50)     NULL,
    [Phone]        [dbo].[Phone]     NULL,
    [PasswordHash] VARCHAR (128)     NOT NULL,
    [PasswordSalt] VARCHAR (10)      NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER  NOT NULL,
    [ModifiedDate] DATETIME          NOT NULL,
    [SysStartTime] DATETIME2 (0)     NOT NULL,
    [SysEndTime]   DATETIME2 (0)     NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_MSSQL_TemporalHistoryFor_1893581784]
    ON [s230806].[MSSQL_TemporalHistoryFor_1893581784]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

