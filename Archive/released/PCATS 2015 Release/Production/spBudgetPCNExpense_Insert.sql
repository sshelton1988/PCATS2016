ALTER PROCEDURE [dbo].[spBudgetPCNExpense_Insert]
@ID		int	output,
@PCNID		int,
@Code		varchar(50),
@Description		varchar(200),
@DlrsPerItem		money,
@NumItems		int,
@MUPerc		money,
@MarkUp		money,
@TotalCost		money,
@DeptGroup		int
AS
INSERT INTO
	DT_BudgetPCNExpenses
(
	[PCNID],
	[Code],
	[Description],
	[DlrsPerItem],
	[NumItems],
	[MUPerc],
	[MarkUp],
	[TotalCost],
	[DeptGroup] -- added 9/22/2015
)
VALUES
(
	@PCNID,
	@Code,
	@Description,
	@DlrsPerItem,
	@NumItems,
	@MUPerc,
	@MarkUp,
	@TotalCost,
	@DeptGroup
)


SELECT @ID = @@IDENTITY
