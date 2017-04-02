#tag Class
Protected Class SQLBuilderTests
Inherits TestGroup
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


End Class
#tag EndClass
