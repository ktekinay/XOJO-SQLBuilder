#tag Class
Protected Class SQLBuilderTests
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub AdditionalClauseTest()
		  dim sql as string 
		  
		  sql = SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).Limit( 1 ).Offset( 5 ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM table LIMIT 1 OFFSET 5", sql
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AdHocTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append _
		  SQLBuilder_MTC.SQLSelect( "" ) _
		  .From( "table" ) _
		  .Where( SQLBuilder_MTC _
		  . Where( "i", 1 ) _
		  . OrWhere( "b", ">", 2 ) _
		  ) _
		  .WhereBetween( "c", 5, 6 ) _
		  .ToString
		  expecteds.Append "SELECT * FROM table WHERE ( i = ? OR b > ? ) AND c BETWEEN ? AND ?"
		  
		  actuals.Append   SQLBuilder_MTC.SQLWith( "some_data", SQLBuilder_MTC _
		  . SQLSelect( "id" ) _
		  . From( "related_table" ) _
		  . Where( "some_column", 3 ) _  
		  ) _
		  .SQLSelect( "" ) _
		  .From( "table ") _
		  .WhereInQuery( "id", SQLBuilder_MTC.SQLSelect( "" ).From( "some_data" ) ) _
		  .ToString
		  expecteds.Append "WITH some_data AS ( SELECT id FROM related_table WHERE some_column = ? ) " + _
		  "SELECT * FROM table WHERE id IN ( SELECT * FROM some_data )"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AssertEqualness(expecteds() As String, actuals() As String)
		  for i as integer = 0 to actuals.Ubound
		    dim expected as string = expecteds( i )
		    dim actual as string = actuals( i )
		    actual = SqueezeWhitespace( actual )
		    Assert.AreEqual expected, actual
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CondOrWhereTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhere( true, "i", 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR i = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereBetween( true, "i", 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR i BETWEEN ? AND ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereExists( true, _
		  SQLBuilder_MTC.SQLSelect( "*" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR EXISTS ( SELECT * )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereIn( true, "i", 1, 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR i IN (?,?,?)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNot( true, _
		  SQLBuilder_MTC.Where( "i", 2 ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR NOT ( i = ? )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNotBetween( true, "i", 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR i NOT BETWEEN ? AND ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNotExists( true, _
		  SQLBuilder_MTC.SQLSelect( "*" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR NOT EXISTS ( SELECT * )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNotIn( true, "i", 1, 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR i NOT IN (?,?,?)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNull( true, "i" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR i IS NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNotNull( true, "i" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR i IS NOT NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereRaw( true, "i = ?" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR i = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhere( false, "i", 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereBetween( false, "i", 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereExists( false, _
		  SQLBuilder_MTC.SQLSelect( "*" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereIn( false, "i", 1, 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNot( false, _
		  SQLBuilder_MTC.Where( "i", 2 ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNotBetween( false, "i", 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNotExists( false, _
		  SQLBuilder_MTC.SQLSelect( "*" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNotIn( false, "i", 1, 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNull( false, "i" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereNotNull( false, "i" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhereRaw( false, "i = ?" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Where( "i", 1 ).CondWhere( false, "a", 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhere( false, "i", 1 ).Where( "a", 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true AND a = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).FROM( "table" ).WhereRaw( "true" ).CondOrWhere( false, "i", 2 ).CondOrWhere( true, "a", 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR a = ?"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CondWhereTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhere( true, "i", 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereBetween( true, "i", 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i BETWEEN ? AND ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereExists( true, _
		  SQLBuilder_MTC.SQLSelect( "*" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE EXISTS ( SELECT * )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereIn( true, "i", 1, 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i IN (?,?,?)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNot( true, _
		  SQLBuilder_MTC.Where( "i", 2 ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE NOT ( i = ? )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNotBetween( true, "i", 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i NOT BETWEEN ? AND ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNotExists( true, _
		  SQLBuilder_MTC.SQLSelect( "*" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE NOT EXISTS ( SELECT * )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNotIn( true, "i", 1, 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i NOT IN (?,?,?)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNull( true, "i" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i IS NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNotNull( true, "i" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i IS NOT NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereRaw( true, "i = ?" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhere( false, "i", 2 ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereBetween( false, "i", 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereExists( false, _
		  SQLBuilder_MTC.SQLSelect( "*" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereIn( false, "i", 1, 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNot( false, _
		  SQLBuilder_MTC.Where( "i", 2 ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNotBetween( false, "i", 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNotExists( false, _
		  SQLBuilder_MTC.SQLSelect( "*" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNotIn( false, "i", 1, 2, 3 ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNull( false, "i" ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereNotNull( false, "i" ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhereRaw( false, "i = ?" ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Where( "i", 1 ).CondWhere( false, "a", 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhere( false, "i", 1 ).Where( "a", 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE a = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhere( false, "i", 2 ).CondOrWhere( true, "a", 3 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE a = ?"
		  
		  actuals.Append _
		  SQLBuilder_MTC.SQLSelect( "" ) _
		  .From( "table" ) _
		  .CondWhere( false, "a", 1 ) _
		  .CondWhere( true, "b", 2 ) _ 
		  .CondWhere( false, "c", 3 ) _
		  .CondWhere( true, "d", 4 ) _
		  .ToString( SQLBuilder_MTC.PHTypes.DollarSignNumber )
		  expecteds.Append "SELECT * FROM table WHERE b = $1 AND d = $2"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmbeddedExpressionsTest()
		  dim sql as string
		  
		  sql = SQLBuilder_MTC.SQLSelect( "" ) _
		  .From( _
		  _
		  SQLBuilder_MTC.SQLSelect( "id" ) _
		  .From( "table" ) _
		  .Where( "i", 1 ), "table_alias" _
		  _
		  ).Where( "j", 2 ) _
		  .ToString( SQLBuilder_MTC.PHTypes.DollarSignNumber )
		  
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM ( SELECT id FROM table WHERE i = $1 ) AS table_alias WHERE j = $2", sql
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmptyWhereTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).CondWhere( false, "i", 3 ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "false" ) _
		  .OrWhereNot( _
		  SQLBuilder_MTC.CondWhere( false, "i", 4 ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE false"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FromClauseTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).ToString
		  expecteds.Append "SELECT * FROM table"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).From( "table2" ).ToString
		  expecteds.Append "SELECT * FROM table, table2"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).LeftJoin( "table2", "table.id = table2.table_id" ).ToString
		  expecteds.Append "SELECT * FROM table LEFT JOIN table2 ON (table.id = table2.table_id)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).LeftJoin( "table2", "table.id = table2.table_id" ).From( "table3" ).ToString
		  expecteds.Append "SELECT * FROM table LEFT JOIN table2 ON (table.id = table2.table_id), table3"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).From( _
		  SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ), "tab" _
		  ).ToString
		  expecteds.Append "SELECT * FROM ( SELECT * FROM table ) AS tab"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).LeftJoin( "table2", _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table3 " ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table LEFT JOIN table2 ON ( SELECT * FROM table3 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).RightJoin( "table2", _
		  SQLBuilder_MTC.Where( "i", "<>", 3 ).Where( "b", "LIKE", "Jerry" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table RIGHT JOIN table2 ON ( i <> ? AND b LIKE ? )"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSQLiteDatabase() As SQLiteDatabase
		  dim db as new SQLiteDatabase
		  db.DatabaseName = "SQLBuilder_MTC_Tests"
		  if not db.Connect then
		    raise new RuntimeException
		  end if
		  
		  return db
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTrueValueTest()
		  self.StopTestOnFail = true
		  
		  dim sb as new SQLBuilder_MTC.Statement
		  dim ut as SQLBuilder_MTC.UnitTestInterface = sb
		  
		  dim values() as variant
		  values.Append "a"
		  
		  dim actual() as variant = ut.GetTrueValues( values )
		  Assert.IsFalse actual is nil, "Array is nil"
		  Assert.AreEqual values.Ubound, actual.Ubound, "Ubound does not match"
		  Assert.AreEqual values( 0 ).StringValue, actual( 0 ).StringValue, "First element does not match"
		  
		  dim s() as string = array( "1", "2", "3" )
		  dim v as variant = s
		  
		  actual = ut.GetTrueValues( v )
		  Assert.AreEqual s.Ubound, actual.Ubound, "String array Ubound does not match"
		  Assert.AreEqual s( 0 ), actual( 0 ).StringValue, "String array first element does not match"
		  
		  dim step1() as variant
		  step1.Append s
		  dim step2() as variant
		  step2.Append step1
		  dim step3() as variant
		  step3.Append step2
		  
		  redim values( -1 )
		  values.Append step3
		  
		  actual = ut.GetTrueValues( values )
		  Assert.AreEqual s.Ubound, actual.Ubound, "Embedded array Ubound does not match"
		  Assert.AreEqual s( 0 ), actual( 0 ).StringValue, "Embedded array first element does not match"
		  
		  //
		  // Check different types of arrays
		  //
		  
		  if true then
		    dim arr() as boolean
		    arr.Append true
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type + " array Ubound does not match"
		    Assert.AreEqual str( arr( 0 ) ), actual( 0 ).StringValue, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as text
		    arr.Append "hi"
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type + " array Ubound does not match"
		    Assert.AreEqual arr( 0 ), actual( 0 ).TextValue, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as string
		    arr.Append "hi"
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type + " array Ubound does not match"
		    Assert.AreEqual arr( 0 ), actual( 0 ).StringValue, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as Int32
		    arr.Append 456
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type +" array Ubound does not match"
		    Assert.AreEqual arr( 0 ), actual( 0 ).Int32Value, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as Int64
		    arr.Append 456
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type +" array Ubound does not match"
		    Assert.AreEqual arr( 0 ), actual( 0 ).Int64Value, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as Double
		    arr.Append 332.123
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type +" array Ubound does not match"
		    Assert.AreEqual arr( 0 ), actual( 0 ).DoubleValue, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as Single
		    arr.Append 332.123
		    dim expectedDouble as double = arr( 0 )
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type +" array Ubound does not match"
		    Assert.AreEqual expectedDouble, actual( 0 ).DoubleValue, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as Currency
		    arr.Append 332.123
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type +" array Ubound does not match"
		    Assert.AreEqual arr( 0 ), actual( 0 ).CurrencyValue, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as Date
		    arr.Append new Date
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type + " array Ubound does not match"
		    Assert.AreEqual arr( 0 ), actual( 0 ).DateValue, type + " array first element does not match"
		  end if
		  
		  if true then
		    dim arr() as Xojo.Core.Date
		    arr.Append Xojo.Core.Date.Now
		    dim type as text = Xojo.Introspection.GetType( arr ).Name
		    redim step1( -1 )
		    step1.Append arr
		    actual = ut.GetTrueValues( values )
		    Assert.AreEqual arr.Ubound, actual.Ubound, type + " array Ubound does not match"
		    dim actualDate as Xojo.Core.Date = actual( 0 )
		    Assert.AreEqual arr( 0 ), actualDate, type + " array first element does not match"
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupByClauseTest()
		  dim sql as string 
		  
		  sql = SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).GroupBy( "id", "name" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM table GROUP BY id, name", sql
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HavingClauseTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).GroupBy( "name" ).Having( "i = ?", 3 ).ToString
		  expecteds.Append "SELECT * FROM table GROUP BY name HAVING i = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).GroupBy( "name" ).Having( _
		  SQLBuilder_MTC.Where( "i", 3 ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table GROUP BY name HAVING ( i = ? )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).GroupBy( "a, b, c" ).Having( "i = ?" , 3 ).Having( "j = ?", "jack" ).ToString
		  expecteds.Append "SELECT * FROM table GROUP BY a, b, c HAVING i = ?, j = ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).GroupBy( "name" ).Having( _
		  SQLBuilder_MTC.Where( "i", 3 ) _
		  ).Having( _
		  SQLBuilder_MTC.Where( "j", true ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table GROUP BY name HAVING ( i = ? ), ( j = ? )"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextStatementTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Union( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "( SELECT * FROM table ) UNION ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Except( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "( SELECT * FROM table ) EXCEPT ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Intersect( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "( SELECT * FROM table ) INTERSECT ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Union( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ), false _
		  ).ToString
		  expecteds.Append "( SELECT * FROM table ) UNION ALL ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Except( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ), false _
		  ).ToString
		  expecteds.Append "( SELECT * FROM table ) EXCEPT ALL ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Intersect( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ), false _
		  ).ToString
		  expecteds.Append "( SELECT * FROM table ) INTERSECT ALL ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).From( "table1" ).Where( "i", 2 ).Union( _
		  SQLBuilder_MTC.SQLSelect( "*" ).From( "table2" ) _
		  ).Intersect( _
		  SQLBuilder_MTC.SQLSelect( "*" ).From( "table3" ) _
		  ).Except( _
		  SQLBuilder_MTC.SQLSelect( "*" ).From( "table4" ), false _
		  ).ToString
		  expecteds.Append "( SELECT * FROM table1 WHERE i = ? ) UNION ( SELECT * FROM table2 ) " + _
		  "INTERSECT ( SELECT * FROM table3 ) EXCEPT ALL ( SELECT * FROM table4 )"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NullSubstitutionTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ) _
		  .Where( "h", nil ).Where( "i", "<>", nil ).Where( "j", "!=", nil ).ToString
		  expecteds.Append "SELECT * FROM table WHERE h IS NULL AND i IS NOT NULL AND j IS NOT NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ) _
		  .Where( "h", "IS", 1 ).Where( "i", "IS NOT", 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE h = ? AND i <> ?"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderByClauseTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).OrderBy( "id" ).ToString
		  expecteds.Append "SELECT * FROM table ORDER BY id"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "a, b, c" ).From( "table" ).OrderBy( 3, 1, 2 ).ToString
		  expecteds.Append "SELECT a, b, c FROM table ORDER BY 3, 1, 2"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrWhereClauseTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.Where( "i", 1 ).OrWhere( "i", 1 ).ToString
		  expecteds.Append "i = ? OR i = ?"
		  
		  actuals.Append SQLBuilder_MTC.Where( "i", nil ).OrWhere( "i", nil ).ToString
		  expecteds.Append "i IS NULL OR i IS NULL"
		  
		  actuals.Append SQLBuilder_MTC.Where( "i", nil ).Where( "a", "<>", 3 ).OrWhere( "b", nil ).ToString
		  expecteds.Append "i IS NULL AND a <> ? OR b IS NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Where( "i", 3 ).OrWhere( "j", true ).WhereBetween( "y", 0, 4 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i = ? OR j = ? AND y BETWEEN ? AND ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Where( "i", 3 ).OrWhere( _
		  SQLBuilder_MTC.Where( "j", true ).OrWhereBetween( "y", 0, 4 ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i = ? OR ( j = ? OR y BETWEEN ? AND ? )"
		  
		  actuals.Append SQLBuilder_MTC.WhereNotNull( "i" ).OrWhereNotNull( "i" ).ToString
		  expecteds.Append "i IS NOT NULL OR i IS NOT NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ) _
		  .WhereIn( "arr",array( "a", "b", "c" ) ) _
		  .OrWhereIn( "arr",array( "a", "b", "c" ) ) _
		  .ToString
		  expecteds.Append "SELECT * FROM table WHERE arr IN (?,?,?) OR arr IN (?,?,?)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "true" ).OrWhereExists( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR EXISTS ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "true" ).OrWhereNot( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR NOT ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "true" ).OrWhereNotBetween( "j", 1, 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR j NOT BETWEEN ? AND ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "true" ).OrWhereNotExists( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR NOT EXISTS ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "true" ) _
		  .OrWhereNotIn( "arr",array( "a", "b", "c" ) ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR arr NOT IN (?,?,?)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "true" ).OrWhereNull( "a" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR a IS NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "true" ).OrWhereNotNull( "a" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR a IS NOT NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "true" ).OrWhereRaw( "a = ? AND b <> ?", 1, 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE true OR a = ? AND b <> ?"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PlaygroundTest()
		  //
		  // Arbitrary clauses
		  //
		  
		  dim actual as string
		  dim expected as string
		  
		  actual = SQLBuilder_MTC.SQLSelect ( "a.id, count(*)" ).From( "table1 a" ).From( "table2 b" ).WhereRaw( "a.id = b.id" ).WhereRaw( "a.thing>b.thing" ).GroupBy( "a.id" ).OrderBy( "a.id").ToString
		  expected = "SELECT" + EndOfLine + _
		  "  a.id, count(*)" + EndOfLine + _
		  "FROM" + EndOfLine + _
		  "  table1 a," + EndOfLine + _
		  "  table2 b" + EndOfLine + _
		  "WHERE" + EndOfLine + _
		  "  a.id = b.id" + EndOfLine + _
		  "  AND a.thing>b.thing" + EndOfLine + _
		  "GROUP BY" + EndOfLine + _
		  "  a.id" + EndOfLine + _
		  "ORDER BY" + EndOfLine + _
		  "  a.id" + EndOfLine
		  Assert.AreEqual expected, actual
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrepareTest()
		  self.StopTestOnFail = true
		  
		  dim db as Database = GetSQLiteDatabase
		  Assert.IsTrue db.Connect, "Can't connect to database"
		  
		  dim sql as string = _
		  "CREATE TABLE tester (id INTEGER PRIMARY KEY NOT NULL UNIQUE, name TEXT);"
		  db.SQLExecute sql
		  Assert.IsFalse db.Error, "Couldn't create table: " + db.ErrorMessage.ToText 
		  
		  //
		  // Note: Once SQLBuilder_MTC supports inserts, this should be replaced
		  //
		  sql = "INSERT INTO tester (name) VALUES ('John'), ('Joe'), ('Larry');"
		  db.SQLExecute sql
		  Assert.IsFalse db.Error, "Couldn't insert values: " + db.ErrorMessage.ToText
		  
		  dim ps as PreparedSQLStatement = _
		  SQLBuilder_MTC.SQLSelect( "*" ).From( "tester" ).Where( "name", "LIKE", "J%" ).Prepare( db )
		  
		  dim rs as RecordSet = ps.SQLSelect
		  Assert.IsFalse db.Error, "Couldn't query with prepared statement: " + db.ErrorMessage.ToText
		  
		  Assert.AreEqual 2, rs.RecordCount, "All records where not found"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplacePlaceholdersTest()
		  dim sb as new SQLBuilder_MTC.Statement
		  dim ut as SQLBuilder_MTC.UnitTestInterface = sb
		  
		  dim sql as string = """some string?"" = ? and 'another string?' = ?"
		  dim expected as string = """some string?"" = $1 and 'another string?' = $2"
		  dim actual as string = ut.ReplacePlaceHolders( sql, SQLBuilder_MTC.PHTypes.DollarSignNumber )
		  Assert.AreEqual expected, actual
		  
		  sql = "a = ? and b = ?"
		  expected = "a = ?1 and b = ?2"
		  actual = ut.ReplacePlaceHolders( sql, SQLBuilder_MTC.PHTypes.QuestionMarkNumber )
		  Assert.AreEqual expected, actual
		  
		  expected = "a = :p00001 and b = :p00002"
		  actual = ut.ReplacePlaceHolders( sql, SQLBuilder_MTC.PHTypes.ColonName )
		  Assert.AreEqual expected, actual
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectClauseTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "*" ).ToString
		  expecteds.Append "SELECT *"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "a, b, c" ).ToString
		  expecteds.Append "SELECT a, b, c"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "a, b" ).SQLSelect( "c" ).ToString
		  expecteds.Append "SELECT a, b, c"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelectDistinct( "a, b" ).SQLSelect( "c" ).ToString
		  expecteds.Append "SELECT DISTINCT a, b, c"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "a = ?", 1 ).ToString( SQLBuilder_MTC.PHTypes.DollarSignNumber )
		  expecteds.Append "SELECT a = $1"
		  
		  AssertEqualness expecteds, actuals
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SqueezeWhitespace(s As String) As String
		  dim rx as new RegEx
		  rx.SearchPattern = "\s+"
		  rx.ReplacementPattern = " "
		  rx.Options.ReplaceAllMatches = true
		  
		  s = rx.Replace( s )
		  return s.Trim
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValuesToPlaceholdersTest()
		  dim sb as new SQLBuilder_MTC.Statement
		  dim ut as SQLBuilder_MTC.UnitTestInterface = sb
		  
		  dim arr() as variant
		  arr.Append 1
		  arr.Append "a"
		  arr.Append true
		  
		  dim placeholders() as string = ut.ValuesToPlaceholders( arr )
		  Assert.AreEqual arr.Ubound, placeholders.Ubound, "Arrays don't match"
		  
		  dim s as string = join( placeholders, "" )
		  Assert.AreEqual "???", s, "Placeholders don't match"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WhereClauseTest()
		  dim actuals() as string
		  dim expecteds() as string
		  
		  actuals.Append SQLBuilder_MTC.Where( "i", 1 ).ToString
		  expecteds.Append "i = ?"
		  
		  actuals.Append SQLBuilder_MTC.Where( "i", nil ).ToString
		  expecteds.Append "i IS NULL"
		  
		  actuals.Append SQLBuilder_MTC.Where( "i", nil ).Where( "a", "<>", 3 ).OrWhere( "b", nil ).ToString
		  expecteds.Append "i IS NULL AND a <> ? OR b IS NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Where( "i", 3 ).Where( "j", true ).OrWhereBetween( "y", 0, 4 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i = ? AND j = ? OR y BETWEEN ? AND ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Where( "i", 3 ).Where( _
		  SQLBuilder_MTC.Where( "j", true ).OrWhereBetween( "y", 0, 4 ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE i = ? AND ( j = ? OR y BETWEEN ? AND ? )"
		  
		  actuals.Append SQLBuilder_MTC.WhereNotNull( "i" ).ToString
		  expecteds.Append "i IS NOT NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereIn( "arr",array( "a", "b", "c" ) ).ToString
		  expecteds.Append "SELECT * FROM table WHERE arr IN (?,?,?)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereExists( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE EXISTS ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereNot( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE NOT ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereNotBetween( "j", 1, 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE j NOT BETWEEN ? AND ?"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereNotExists( _
		  SQLBuilder_MTC.SQLSelect( "" ).From( "table2" ) _
		  ).ToString
		  expecteds.Append "SELECT * FROM table WHERE NOT EXISTS ( SELECT * FROM table2 )"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereNotIn( "arr",array( "a", "b", "c" ) ).ToString
		  expecteds.Append "SELECT * FROM table WHERE arr NOT IN (?,?,?)"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereNull( "a" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE a IS NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereNotNull( "a" ).ToString
		  expecteds.Append "SELECT * FROM table WHERE a IS NOT NULL"
		  
		  actuals.Append SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).WhereRaw( "a = ? AND b <> ?", 1, 2 ).ToString
		  expecteds.Append "SELECT * FROM table WHERE a = ? AND b <> ?"
		  
		  AssertEqualness expecteds, actuals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WithClauseTest()
		  dim sql as string 
		  
		  sql = SQLBuilder_MTC.SQLWith( "a_with", SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ) ).SQLSelect( "1" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "WITH a_with AS ( SELECT * FROM table ) SELECT 1", sql
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
