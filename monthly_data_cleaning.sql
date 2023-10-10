---Cleaning In SQL

--checking for null values 
		select * from [dbo].[electricity-exports-and-imports-monthly]
		where	[Period] is null or 
				[Activity]is null or
				[Source]is null or
				[Destination] is null or
				[Energy (MW h)]is null or
				[Total Value (CAN$)] is null or 
				[Price (CAN$ MW h)]is null ;
--No null founds
--checking data type and converting data type in desirable form
--column--[Total Value (CAN$)]
		
		Select ISNUMERIC([Total Value (CAN$)]) as number from[dbo].[electricity-exports-and-imports-annual]
		order by number desc; --looked for "0" value if any non-numeric present there it will give "0" value
		
		--cleaning negative value as there is no chance for negative value 
		
				alter table [dbo].[electricity-exports-and-imports-annual]
				drop column Total_Value 
			
				alter table [dbo].[electricity-exports-and-imports-annual]
				add Total_Value bigint;
		
				update [dbo].[electricity-exports-and-imports-annual]
				set Total_Value = abs([Total Value (CAN$)])

--same process follows for next column [Price (CAN$ MW h)]

	Select ISNUMERIC([Price (CAN$ MW h)]) as number from[dbo].[electricity-exports-and-imports-annual]
	order by number asc; --looked for "0" value if any non-numeric present there it will give "0" value

	Select [Price (CAN$ MW h)],ISNUMERIC([Price (CAN$ MW h)]) as number from[dbo].[electricity-exports-and-imports-annual]
	order by number asc; --looked for "0" value if any non-numeric present there it will give "0" value

			--converting string to numeric

				alter table [dbo].[electricity-exports-and-imports-annual]
				add Price float, dumy_price varchar(255);
	
				update [dbo].[electricity-exports-and-imports-annual]
				set dumy_price =  [Price (CAN$ MW h)]
	
				update [dbo].[electricity-exports-and-imports-annual]
				set dumy_price = 0
				where dumy_price = 'confidential' ---- Found 54 string value----

				update [dbo].[electricity-exports-and-imports-annual]
				set Price =  [dumy_price]

				update [dbo].[electricity-exports-and-imports-annual]
				set Price = abs(Price) -----converting negative to positive

				alter table [dbo].[electricity-exports-and-imports-annual]
				drop column dumy_price --- dropping temproray column

			Select * from[dbo].[electricity-exports-and-imports-annual]
--Cleaning is done