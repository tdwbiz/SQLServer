/*

Stock schema tables only

*/

CREATE PROCEDURE stp_StockDataJSONOuput
@sym VARCHAR(250)
AS
BEGIN

	DECLARE @sql NVARCHAR(MAX)
	-- Testing: DECLARE @sym VARCHAR(250) = ''

	SET @sql = 'SELECT ''{"' + @sym + 'ID": "'' + CAST(' + @sym + 'ID AS VARCHAR) + ''",
		"Date": "'' + CAST([Date] AS VARCHAR) + ''"
		"Price": "'' + CAST(Price AS VARCHAR) + ''" 
		"TwoHundredDaySMA": "'' + CAST(TwoHundredDaySMA AS VARCHAR) + ''"}''
	FROM stock.' + @sym + 'HistoricalData'

	EXECUTE(@sql)


/*

CREATE TABLE ##JSONTemp(
	ID INT IDENTITY(1,1),
	JSONData VARCHAR(8000)
)

INSERT INTO ##JSONTemp (JSONData)
EXECUTE stp_StockDataJSONOuput 'BAC'

DECLARE @begin INT = 1, @max INT, @string VARCHAR(MAX) = '', @temp VARCHAR(MAX)
SELECT @max = MAX(ID) FROM ##JSONTemp

WHILE @begin <= @max
BEGIN
	
	SELECT @temp = JSONData FROM ##JSONTemp WHERE ID = @begin
	
	IF @begin = @max
	BEGIN
	
		SELECT @string = @string + @temp + '] }'
		
	END
	IF @begin = 1
	BEGIN

		SELECT @string = '{StockID": "BAC", "StockValues": [' + @temp

	END
	ELSE
	BEGIN

		SELECT @string = @string + @temp + ', '

	END

	SET @begin = @begin + 1
	SET @temp = ''

END

SELECT @string

*/


END
