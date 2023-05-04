CREATE TABLE [dbo].[hourly_calories] (
    [Id]       NVARCHAR (50) NOT NULL,
    [Date]     DATE          NOT NULL,
    [Hour]     TIME (7)      NOT NULL,
    [Calories] NVARCHAR (50) NOT NULL
);
GO

