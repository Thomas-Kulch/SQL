USE [AdventureWorks2017]
GO
/****** Object:  StoredProcedure [dbo].[spTotalSalesByProduct]    Script Date: 2/13/2020 8:58:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--Test Code: [dbo].[spTotalSalesByProduct] '01/01/2013', '12/31/2013'
-- =============================================
ALTER PROCEDURE [dbo].[spTotalSalesByProduct] 
	@startdate datetime, @enddate datetime, @Product VARCHAR(MAX)
AS
BEGIN
	
	select	distinct prod.ProductID, 
			prod.name as ProductName,
			sod.UnitPrice,
			sod.OrderQty,
			sod.ModifiedDate

	from [Sales].[SalesOrderDetail] as SOD

	inner join [Production].[Product] as Prod

	on SOD.ProductID = Prod.ProductID
	where sod.ModifiedDate between @startdate and @enddate
	and Prod.Name in (@Product)

END
