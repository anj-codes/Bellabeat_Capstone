CREATE TABLE [dbo].[daily_activity] (
    [Id]                       NVARCHAR (50)   NOT NULL,
    [ActivityDate]             DATE            NOT NULL,
    [TotalSteps]               NVARCHAR (50)   NOT NULL,
    [TotalDistance]            DECIMAL (18, 2) NOT NULL,
    [TrackerDistance]          DECIMAL (18, 2) NOT NULL,
    [LoggedActivitiesDistance] DECIMAL (18, 2) NOT NULL,
    [VeryActiveDistance]       DECIMAL (18, 2) NOT NULL,
    [ModeratelyActiveDistance] DECIMAL (18, 2) NOT NULL,
    [LightActiveDistance]      DECIMAL (18, 2) NOT NULL,
    [SedentaryActiveDistance]  DECIMAL (18, 2) NOT NULL,
    [VeryActiveMinutes]        NVARCHAR (50)   NOT NULL,
    [FairlyActiveMinutes]      NVARCHAR (50)   NOT NULL,
    [LightlyActiveMinutes]     NVARCHAR (50)   NOT NULL,
    [SedentaryMinutes]         NVARCHAR (50)   NOT NULL,
    [Calories]                 NVARCHAR (50)   NOT NULL
);


GO

