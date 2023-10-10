----Dividing tables in import and export
	--Exports
		select*from [dbo].[electricity-exports-and-imports-annual]
		where [Activity]= 'Exports';

		create table All_export 
		select *from [dbo].[electricity-exports-and-imports-annual]
		where [Activity]= 'Exports';
		
			--getting total yearly electricity export from dataset
			--(in dataset it was already aggregated with each year)

			Select * from [dbo].[electricity-exports-and-imports-annual]
			where [Activity]= 'Exports' and [Source]= 'Total' 
			and [Destination] = 'Total' ;


	--import
		select*from [dbo].[electricity-exports-and-imports-annual]
		where [Activity]= 'Imports';
						
			--getting yearly total electricity import from dataset
			--(in dataset it was already aggregated with each year)

			Select * from [dbo].[electricity-exports-and-imports-annual]
			where [Activity]= 'Imports' and [Source]= 'Total' 
			or [Destination] = 'Total' ;


--Import/Export  in from Alberta 

			Select * from [dbo].[electricity-exports-and-imports-annual]
			where [Destination] = 'Alberta' or [Source] = 'Alberta'
			order by [year]


--getting price rate above 50 CAN$

			Select * from [dbo].[electricity-exports-and-imports-annual]
			where Price> '50' and ([Destination] = 'Alberta' or [Source] = 'Alberta' )
			order by 2, 1

--All total import in Alberta

			Select * from [dbo].[electricity-exports-and-imports-annual]
			where [Destination] = 'Alberta' and [Source] = 'Total'
			order by 2, 1

--All total export from Alberta

			Select * from [dbo].[electricity-exports-and-imports-annual]
			where [Source] = 'Alberta' and [Destination] = 'Total' 
			order by 2, 1

