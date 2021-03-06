USE [eriettaDB2]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentsID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](60) NOT NULL,
	[LastName] [varchar](60) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[TuitionFees] [int] NULL,
	[Courses] [varchar](50) NOT NULL,
	[Assignments] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Question1]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Question1] AS
SELECT *
FROM Students;
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[TrainersID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](60) NOT NULL,
	[LastName] [varchar](60) NOT NULL,
	[Courses] [varchar](50) NOT NULL,
	[Assignments] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Question2]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----A list of all the trainers
CREATE VIEW [dbo].[Question2] AS
SELECT *
FROM Trainers;
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[AssignmentsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Descriptions] [varchar](50) NOT NULL,
	[DateOfSubmission] [date] NOT NULL,
	[Mark] [int] NULL,
	[Courses] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Question3]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----A list of all the assignments
CREATE VIEW [dbo].[Question3] AS
SELECT *
FROM Assignments;
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CoursesID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[TypeOfCourse] [varchar](50) NOT NULL,
	[DateOfStart] [date] NOT NULL,
	[DateOfEnd] [date] NOT NULL,
	[Assignments] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Question4]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----A list of all the courses
CREATE VIEW [dbo].[Question4] AS
SELECT *
FROM Courses;
GO
/****** Object:  View [dbo].[Question5]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Question5] AS
SELECT Students.FirstName,Students.LastName, Courses.Title
FROM Students, Courses
WHERE Students.Courses = Courses.Title ;
GO
/****** Object:  View [dbo].[Question6]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----All the trainers per course
CREATE VIEW [dbo].[Question6] AS
SELECT Trainers.FirstName,Trainers.LastName, Courses.Title
FROM  Trainers, Courses
WHERE Trainers.Courses = Courses.Title ;
GO
/****** Object:  View [dbo].[Question7]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Question7] AS
SELECT DISTINCT Courses.Title AS CourseTitle, Assignments.Title AS AssignTitle, Assignments.Descriptions AS DescriptionAssign
FROM  Assignments, Courses
WHERE Assignments.Courses = Courses.Title ;
GO
/****** Object:  View [dbo].[Question8]    Script Date: 26/1/2022 1:06:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Question8] AS
SELECT Assignments.Title  AS AssigmentsTitle, Assignments.Descriptions, Courses.Title  AS CourseTitle, Students.FirstName,Students.LastName
FROM  Assignments, Courses, Students, Trainers
WHERE Trainers.Courses 		= Courses.Title 
 AND  Students.Courses  	= Courses.Title 
 AND  Assignments.Courses	= Courses.Title  
;
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD FOREIGN KEY([Courses])
REFERENCES [dbo].[Courses] ([Title])
GO
ALTER TABLE [dbo].[Trainers]  WITH CHECK ADD FOREIGN KEY([Courses])
REFERENCES [dbo].[Courses] ([Title])
GO
