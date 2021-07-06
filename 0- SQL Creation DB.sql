USE [ITI_Exam_system_G1]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[course_id] [int] NOT NULL,
	[course_name] [nvarchar](50) NOT NULL,
	[topic_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[dept_id] [int] NOT NULL,
	[dept_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [c1] UNIQUE NONCLUSTERED 
(
	[dept_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_code] [int] NOT NULL,
	[No_MCQ] [int] NOT NULL,
	[No_TF] [int] NOT NULL,
	[exam_model_ans] [text] NULL,
	[exam_grade]  AS ((isnull([No_MCQ],(0))+isnull([No_TF],(0)))*(10)) PERSISTED,
	[course_id] [int] NULL,
 CONSTRAINT [PK__Exam__ED63C0BB3A2B53A5] PRIMARY KEY CLUSTERED 
(
	[Exam_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_questions]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_questions](
	[Exam_code] [int] NOT NULL,
	[question_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_code] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor_courses]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_courses](
	[inst_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[evaluation] [int] NULL,
 CONSTRAINT [PK__Instruct__FAF77B778E1553AD] PRIMARY KEY CLUSTERED 
(
	[inst_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[inst_id] [int] NOT NULL,
	[inst_name] [nvarchar](50) NOT NULL,
	[dept_id] [int] NULL,
 CONSTRAINT [PK__Instruct__0206940DA8632448] PRIMARY KEY CLUSTERED 
(
	[inst_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[options]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[options](
	[Ans_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_answers]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_answers](
	[question_id] [int] NOT NULL,
	[Ans_id] [int] NOT NULL,
	[Option_content] [nvarchar](150) NULL,
 CONSTRAINT [PK_question_answers] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC,
	[Ans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[question_id] [int] NOT NULL,
	[question_content] [nvarchar](250) NOT NULL,
	[quest_model_Ans] [nvarchar](250) NULL,
	[question_type] [nvarchar](20) NOT NULL,
	[quest_full_mark] [int] NOT NULL,
	[course_id] [int] NULL,
	[Model_Ans_id] [int] NULL,
 CONSTRAINT [PK__Question__2EC2154904DFDCA1] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_courses]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_courses](
	[course_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[Crs_grade] [int] NULL,
 CONSTRAINT [PK__student___3DBDC7C712C8E2E7] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_exam_ans]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_exam_ans](
	[Exam_code] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[student_answer] [nvarchar](50) NOT NULL,
	[student_grade] [int] NULL,
 CONSTRAINT [PK__student___5FC0F0D2F1E696B8] PRIMARY KEY CLUSTERED 
(
	[Exam_code] ASC,
	[student_id] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_id] [int] NOT NULL,
	[student_name] [nvarchar](50) NOT NULL,
	[student_soical] [nvarchar](250) NULL,
	[student_mail] [nvarchar](100) NOT NULL,
	[student_password] [nvarchar](50) NOT NULL,
	[dept_id] [int] NULL,
 CONSTRAINT [PK__Students__2A33069ADF3014B5] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [c3] UNIQUE NONCLUSTERED 
(
	[student_mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [c4] UNIQUE NONCLUSTERED 
(
	[student_soical] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topic]    Script Date: 6/25/2021 3:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topic](
	[topic_id] [int] NOT NULL,
	[topic_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ((1)) FOR [dept_id]
GO
ALTER TABLE [dbo].[Instructor_courses] ADD  CONSTRAINT [DF_Instructor_courses_evaluation]  DEFAULT (NULL) FOR [evaluation]
GO
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF__Questions__quest__3A81B327]  DEFAULT ((10)) FOR [quest_full_mark]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [c8] FOREIGN KEY([topic_id])
REFERENCES [dbo].[topic] ([topic_id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [c8]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK__Exam__course_id__36B12243] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK__Exam__course_id__36B12243]
GO
ALTER TABLE [dbo].[Exam_questions]  WITH CHECK ADD  CONSTRAINT [c16] FOREIGN KEY([Exam_code])
REFERENCES [dbo].[Exam] ([Exam_code])
GO
ALTER TABLE [dbo].[Exam_questions] CHECK CONSTRAINT [c16]
GO
ALTER TABLE [dbo].[Exam_questions]  WITH CHECK ADD  CONSTRAINT [c17] FOREIGN KEY([question_id])
REFERENCES [dbo].[Questions] ([question_id])
GO
ALTER TABLE [dbo].[Exam_questions] CHECK CONSTRAINT [c17]
GO
ALTER TABLE [dbo].[Instructor_courses]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__cours__4222D4EF] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Instructor_courses] CHECK CONSTRAINT [FK__Instructo__cours__4222D4EF]
GO
ALTER TABLE [dbo].[Instructor_courses]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__inst___412EB0B6] FOREIGN KEY([inst_id])
REFERENCES [dbo].[Instructors] ([inst_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Instructor_courses] CHECK CONSTRAINT [FK__Instructo__inst___412EB0B6]
GO
ALTER TABLE [dbo].[Instructors]  WITH CHECK ADD  CONSTRAINT [c7] FOREIGN KEY([dept_id])
REFERENCES [dbo].[Departments] ([dept_id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Instructors] CHECK CONSTRAINT [c7]
GO
ALTER TABLE [dbo].[question_answers]  WITH CHECK ADD  CONSTRAINT [C50] FOREIGN KEY([question_id])
REFERENCES [dbo].[Questions] ([question_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[question_answers] CHECK CONSTRAINT [C50]
GO
ALTER TABLE [dbo].[question_answers]  WITH CHECK ADD  CONSTRAINT [C501] FOREIGN KEY([Ans_id])
REFERENCES [dbo].[options] ([Ans_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[question_answers] CHECK CONSTRAINT [C501]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__cours__3B75D760] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__cours__3B75D760]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [FK__student_c__cours__45F365D3] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [FK__student_c__cours__45F365D3]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [FK__student_c__stude__46E78A0C] FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([student_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [FK__student_c__stude__46E78A0C]
GO
ALTER TABLE [dbo].[student_exam_ans]  WITH CHECK ADD  CONSTRAINT [FK__student_e__Exam___4AB81AF0] FOREIGN KEY([Exam_code])
REFERENCES [dbo].[Exam] ([Exam_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[student_exam_ans] CHECK CONSTRAINT [FK__student_e__Exam___4AB81AF0]
GO
ALTER TABLE [dbo].[student_exam_ans]  WITH CHECK ADD  CONSTRAINT [FK__student_e__stude__4BAC3F29] FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([student_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[student_exam_ans] CHECK CONSTRAINT [FK__student_e__stude__4BAC3F29]
GO
ALTER TABLE [dbo].[student_exam_ans]  WITH CHECK ADD  CONSTRAINT [FK_student_exam_ans_Questions] FOREIGN KEY([question_id])
REFERENCES [dbo].[Questions] ([question_id])
GO
ALTER TABLE [dbo].[student_exam_ans] CHECK CONSTRAINT [FK_student_exam_ans_Questions]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [c2] FOREIGN KEY([dept_id])
REFERENCES [dbo].[Departments] ([dept_id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [c2]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [c9] CHECK  ((([No_MCQ]+[No_TF])=(10)))
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [c9]
GO
ALTER TABLE [dbo].[Instructor_courses]  WITH CHECK ADD  CONSTRAINT [c13] CHECK  (([evaluation]=(5) OR [evaluation]=(4) OR [evaluation]=(3) OR [evaluation]=(2) OR [evaluation]=(1) OR [evaluation]=NULL))
GO
ALTER TABLE [dbo].[Instructor_courses] CHECK CONSTRAINT [c13]
GO
ALTER TABLE [dbo].[student_exam_ans]  WITH CHECK ADD  CONSTRAINT [c15] CHECK  (([student_grade]<=(100)))
GO
ALTER TABLE [dbo].[student_exam_ans] CHECK CONSTRAINT [c15]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [c5] CHECK  (([student_mail] like '%_@_%.__%'))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [c5]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [c6] CHECK  ((len([student_password])>=(8)))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [c6]
GO
