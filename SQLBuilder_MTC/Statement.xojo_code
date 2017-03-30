#tag Class
Protected Class Statement
Implements WhereClause,SelectClause,FromClause,AdditionalClause,UnitTestInterface
	#tag Method, Flags = &h21
		Private Sub AppendFromParam()
		  #pragma warning "Finish this!"
		  
		  dim f as new SQLBuilder_MTC.FromParams
		  p.Expression = expression
		  if not ( values is nil ) then
		    values = GetTrueValues( values )
		    for i as integer = 0 to values.Ubound
		      p.Values.Append values( i )
		    next
		  end if
		  
		  p.IsNOT = isNOT
		  p.IsOR = isOR
		  
		  FromParams.Append p
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendToArray(appendTo() As String, fromArr() As String)
		  for i as integer =0 to fromArr.Ubound
		    appendTo.Append fromArr( i )
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendWhereParam(expression As Variant, values() As Variant, isNOT As Boolean, isOR As Boolean)
		  dim p as new SQLBuilder_MTC.WhereParams
		  p.Expression = expression
		  if not ( values is nil ) then
		    values = GetTrueValues( values )
		    for i as integer = 0 to values.Ubound
		      p.Values.Append values( i )
		    next
		  end if
		  
		  p.IsNOT = isNOT
		  p.IsOR = isOR
		  
		  WhereParams.Append p
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhere(includeIf As Boolean, statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhere( statement )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhere(includeIf As Boolean, expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhere( expression, comparison, value )
		  else
		    return self
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhere(includeIf As Boolean, expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return CondOrWhere( includeIf, expression, "=", value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereBetween( expression, lowValue, highValue )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereExists( subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereIn( expression, subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereIn( expression, values )
		  else
		    return self
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNot(includeIf As Boolean, statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNot( statement )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNotBetween( expression, lowValue, highValue )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNotExists( subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNotIn( expression, subQuery )
		  else
		    return self
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNotIn( expression, values )
		  else
		    return self
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereRaw(includeIf As Boolean, expression As String, ParamArray values() As String) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereRaw( expression, values )
		  else
		    return self
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return Where( statement )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return Where( expression, comparison, value )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return CondWhere( includeIf, expression, "=", value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereBetween( expression, lowValue, highValue )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereExists( subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereIn( expression, subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereIn( expression, values )
		  else
		    return self
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNot(includeIf As Boolean, statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereNot( statement )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereNotBetween( expression, lowValue, highValue )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereNotExists( subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereNotIn( expression, subQuery )
		  else
		    return self
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereNotIn( expression, values )
		  else
		    return self
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  return CondWhere( includeIf, expression, "<>", nil )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  return CondWhere( includeIf, expression, "=", nil )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereRaw(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereRaw( expression, values )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CrossJoin(table As String) As SQLBuilder_MTC.FromClause
		  Tables.Append "CROSS JOIN " + table 
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoSQLSelect(expression As String, values() As Variant)
		  #pragma warning "Finish this!"
		  
		  'AppendToArray self.Columns, columns
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(subQuery As SQLBuilder_MTC.Statement, alias As String) As SQLBuilder_MTC.FromClause
		  #pragma warning "Finish this!"
		  
		  self.Tables.Append expression
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(expression As String) As SQLBuilder_MTC.FromClause
		  self.Tables.Append expression
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  Tables.Append "FULL JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTrueValues(values As Variant) As Variant()
		  //
		  // A ParamArray might embed the true array inside another array
		  // so will drill down and extract that
		  //
		  
		  dim result() as variant
		  if values.IsNull then
		    return result
		  end if
		  
		  dim autoValues as auto = values
		  do
		    dim ti as Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType( autoValues )
		    select case ti.FullName
		    case "Date()"
		      dim arr() as Date = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Xojo.Core.Date()"
		      dim arr() as Xojo.Core.Date = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Object()" // Can't ever really be an object
		      result = autoValues
		      if result.Ubound = 0 and result( 0 ).IsArray then
		        autoValues = result( 0 )
		        continue do
		      end if
		      
		    case "String()"
		      dim arr() as string = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Text()"
		      dim arr() as text = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Integer()"
		      dim arr() as integer = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Int32()"
		      dim arr() as Int32 = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Int64()"
		      dim arr() as Int64 = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Double()"
		      dim arr() as double = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Single()"
		      dim arr() as single = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Currency()"
		      dim arr() as currency = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    case "Boolean()"
		      dim arr() as boolean = autoValues
		      redim result( arr.Ubound )
		      for i as integer = 0 to arr.Ubound
		        result( i ) = arr( i )
		      next
		      
		    end select
		    
		    //
		    // If we get here, we've processed as much as we can
		    //
		    exit do
		  loop
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroupBy(ParamArray columns() As String) As SQLBuilder_MTC.AdditionalClause
		  AppendToArray GroupBys, columns
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Having(ParamArray conditions() As String) As SQLBuilder_MTC.AdditionalClause
		  AppendToArray Havings, conditions
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InnerJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  Tables.Append "INNER JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  Tables.Append "JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JoinRaw(expression As String) As SQLBuilder_MTC.FromClause
		  self.Tables.Append expression
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  Tables.Append "LEFT JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Limit(limit As Integer) As SQLBuilder_MTC.AdditionalClause
		  SQLLimit.Limit = limit
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Offset(offset As Integer) As SQLBuilder_MTC.AdditionalClause
		  SQLLimit.Offset = offset
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Function Operator_Convert() As String
		  return ToString
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderBy(ParamArray columnIndexes() As Integer) As SQLBuilder_MTC.AdditionalClause
		  for i as integer = 0 to columnIndexes.Ubound
		    OrderBys.Append str( columnIndexes( i ) )
		  next
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderBy(ParamArray expression() As String) As SQLBuilder_MTC.AdditionalClause
		  AppendToArray OrderBys, expression
		  
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhere(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam statement, nil, false, true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhere(expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append value
		  
		  AppendWhereParam expression + comparison + kSQLPlaceholder, values, false, true
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhere(expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return OrWhere( expression, "=", value )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append lowValue
		  values.Append highValue
		  
		  AppendWhereParam expression + " BETWEEN ? AND ?", values, true, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereExists(subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return OrWhere( "", "EXISTS", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereIn(expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return OrWhere( expression, "IN", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim placeholders() as string = ValuesToPlaceholders( values )
		  AppendWhereParam expression + " IN (" + join( placeholders, "," ) + ")", values, false, true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNot(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam statement, nil, true, true
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append lowValue
		  values.Append highValue
		  
		  AppendWhereParam expression + " NOT BETWEEN ? AND ?", values, false, true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotExists(subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return OrWhere( "", "NOT EXISTS", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotIn(expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return OrWhere( expression, "NOT IN", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim placeholders() as string = ValuesToPlaceholders( values )
		  AppendWhereParam expression + " NOT IN (" + join( placeholders, "," ) + ")", values, false, true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereRaw(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam expression, values, false, true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OuterJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  #pragma warning "Finish this!"
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  Tables.Append "RIGHT JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  OperationType = "SELECT"
		  DoSQLSelect expression, values
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelectDistinct(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  OperationType = "SELECT DISTINCT"
		  DoSQLSelect expression, values
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  #pragma warning "Finish this!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ValuesToPlaceholders(values() As Variant) As String()
		  dim result() as string
		  if values is nil then
		    return result
		  end if
		  values = GetTrueValues( values )
		  for each v as variant in values
		    result.Append kSQLPlaceholder
		  next
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam statement, nil, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  if value.IsNull then
		    
		    select case comparison.Trim
		    case "=", "IS"
		      return WhereNull( expression )
		    case else
		      return WhereNotNull( expression )
		    end select
		    
		  else
		    
		    select case comparison.Trim
		    case "IS"
		      comparison = "="
		    case "IS NOT" 
		      comparison = "<>"
		    end select
		    
		    return WhereRaw( expression + comparison + kSQLPlaceholder, value )
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return Where( expression, "=", value )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append lowValue
		  values.Append highValue
		  
		  AppendWhereParam expression + " BETWEEN ? AND ?", values, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereExists(subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return Where( "", "EXISTS", subQuery )
		  
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return Where( expression, "IN", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim placeholders() as string = ValuesToPlaceholders( values )
		  AppendWhereParam expression + " IN (" + join( placeholders, "," ) + ")", values, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNot(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam statement, nil, true, false
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append lowValue
		  values.Append highValue
		  
		  AppendWhereParam expression + " NOT BETWEEN ? AND ?", values, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotExists(subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return Where( "", "NOT EXISTS", subQuery )
		  
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return Where( expression, "NOT IN", subQuery )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim placeholders() as string = ValuesToPlaceholders( values )
		  AppendWhereParam expression + " NOT IN (" + join( placeholders, "," ) + ")", values, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotNull(expression As String) As SQLBuilder_MTC.WhereClause
		  return Where( expression, "<>", nil )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNull(expression As String) As SQLBuilder_MTC.WhereClause
		  return Where( expression, "=", nil )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereRaw(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam expression, values, false, false
		  
		  return self
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Columns() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FromParams() As FromParam
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GroupBys() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Havings() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( hidden ) Private mOperationType As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( hidden ) Private mSQLLimit As LimitParams
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return mOperationType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if mOperationType <> "" then
			    //
			    // It was already selected, so this is an error
			    //
			    dim err as new SQLBuilderException( "You can only use one operation type", CurrentMethodName )
			    raise err
			  end if
			  
			  mOperationType = value
			End Set
		#tag EndSetter
		Private OperationType As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private OrderBys() As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if mSQLLimit is nil then
			    mSQLLimit = new LimitParams
			  end if
			  
			  return mSQLLimit
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSQLLimit = value
			End Set
		#tag EndSetter
		Private SQLLimit As LimitParams
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self
			  
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private WhereParams() As SQLBuilder_MTC.WhereParams
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
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
