#tag Class
Protected Class SQLBuilderTests
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub FromClauseTest()
		  dim sql as string 
		  
		  sql = SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM table", sql
		  
		  sql = SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).From( "table2" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM table, table2", sql
		  
		  sql = SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).LeftJoin( "table2", "table.id = table2.table_id" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM table LEFT JOIN table2 ON (table.id = table2.table_id)", sql
		  
		  sql = SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ).LeftJoin( "table2", "table.id = table2.table_id" ).From( "table3" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM table LEFT JOIN table2 ON (table.id = table2.table_id), table3", sql
		  
		  sql = SQLBuilder_MTC.SQLSelect( "*" ).From( _
		  SQLBuilder_MTC.SQLSelect( "*" ).From( "table" ), "tab" _
		  ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM ( SELECT * FROM table ) AS tab", sql
		  
		End Sub
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
		Sub ReplaceHoldersTest()
		  dim sb as new SQLBuilder_MTC.Statement
		  dim ut as SQLBuilder_MTC.UnitTestInterface = sb
		  
		  dim sql as string = """some string?"" = ? and 'another string?' = ?"
		  dim expected as string = """some string?"" = $1 and 'another string?' = $2"
		  
		  dim actual as string = ut.ReplacePlaceHolders( sql, SQLBuilder_MTC.PHTypes.DollarSignNumber )
		  
		  Assert.AreEqual expected, actual
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectClauseTest()
		  dim sql as string 
		  
		  sql = SQLBuilder_MTC.SQLSelect( "*" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT *", sql
		  
		  sql = SQLBuilder_MTC.SQLSelect( "a, b, c" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT a, b, c", sql
		  
		  sql = SQLBuilder_MTC.SQLSelect( "a, b" ).SQLSelect( "c" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT a, b, c", sql
		  
		  sql = SQLBuilder_MTC.SQLSelectDistinct( "a, b" ).SQLSelect( "c" ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT DISTINCT a, b, c", sql
		  
		  sql = SQLBuilder_MTC.SQLSelect( "a = ?", 1 ).ToString( SQLBuilder_MTC.PHTypes.DollarSignNumber )
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT a = $1", sql
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
		  dim sql as string 
		  
		  sql = SQLBuilder_MTC.Where( "i", 1 ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "i = ?", sql
		  
		  sql = SQLBuilder_MTC.Where( "i", nil ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "i IS NULL", sql
		  
		  sql = SQLBuilder_MTC.Where( "i", nil ).Where( "a", "<>", 3 ).OrWhere( "b", nil ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "i IS NULL AND a <> ? OR b=?", sql
		  
		  sql = SQLBuilder_MTC.SQLSelect( "" ).From( "table" ).Where( "i", 3 ).Where( "j", true ).OrWhereBetween( "y", 0, 4 ).ToString
		  sql = SqueezeWhitespace( sql )
		  Assert.AreEqual "SELECT * FROM table WHERE i = ? AND j = ? OR y BETWEEN ? AND ?", sql
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
