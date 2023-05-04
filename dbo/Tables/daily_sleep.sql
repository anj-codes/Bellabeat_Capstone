CREATE TABLE [dbo].[daily_sleep] (
    [Id]                 NVARCHAR (50) NULL,
    [Date]               DATE          NULL,
    [Hour]               TIME (7)      NULL,
    [TotalSleepRecords]  NVARCHAR (50) NULL,
    [TotalMinutesAsleep] NVARCHAR (50) NULL,
    [TotalTimeInBed]     NVARCHAR (50) NULL
);
GO

