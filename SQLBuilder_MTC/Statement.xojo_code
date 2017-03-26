#tag Class
Protected Class Statement
Implements WhereClause,SelectClause,FromClause,AdditionalClause
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
		Function CondOrWhere(includeIf As Boolean, column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhere( column, comparison, value )
		  else
		    return self
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhere(includeIf As Boolean, column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return CondOrWhere( includeIf, column, "=", value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereBetween(includeIf As Boolean, column As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereBetween( column, lowValue, highValue )
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
		Function CondOrWhereNotBetween(includeIf As Boolean, column As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNotBetween( column, lowValue, highValue )
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
		Function CondWhere(includeIf As Boolean, expression As SQLBuilder_MTC.Statement, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return Where( expression, values )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return Where( column, comparison, value )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return CondWhere( includeIf, column, "=", value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereBetween(includeIf As Boolean, column As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereBetween( column, lowValue, highValue )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereIn(includeIf As Boolean, column As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereIn( column, subQuery )
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
		Function CondWhereNotBetween(includeIf As Boolean, column As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereNotBetween( column, lowValue, highValue )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotNull(includeIf As Boolean, column As String) As SQLBuilder_MTC.WhereClause
		  return CondWhere( includeIf, column, "<>", nil )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNull(includeIf As Boolean, column As String) As SQLBuilder_MTC.WhereClause
		  return CondWhere( includeIf, column, "=", nil )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereRaw(includeIf As Boolean, statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereRaw( statement )
		  else
		    return self
		  end if
		  
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
		  
		  
		  'AppendToArray self.Columns, columns
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(table As String, ParamArray tables() As String) As SQLBuilder_MTC.FromClause
		  self.Tables.Append table
		  AppendToArray self.Tables, tables
		  
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
		Private Function GetTrueValues(values() As Variant) As Variant()
		  //
		  // A ParamArray might embed the true array inside another array
		  // so will drill down and extract that
		  //
		  
		  dim result() as variant = values
		  
		  while result.Ubound = 0 and result( 0 ).IsArray
		    result = result( 0 )
		  wend
		  
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
		Function OrderBy(ParamArray columnsOrExpressions() As String) As SQLBuilder_MTC.AdditionalClause
		  AppendToArray OrderBys, columnsOrExpressions
		  
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
		Function OrWhere(column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append value
		  
		  AppendWhereParam column + comparison + kSQLPlaceholder, values, false, true
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhere(column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return OrWhere( column, "=", value )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereBetween(column As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append lowValue
		  values.Append highValue
		  
		  AppendWhereParam column + " BETWEEN ? AND ?", values, true, false
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
		Function OrWhereNotBetween(column As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append lowValue
		  values.Append highValue
		  
		  AppendWhereParam column + " NOT BETWEEN ? AND ?", values, false, true
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
		  return SQLSelect( expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelectDistinct(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  return SQLSelectDistinct( expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  #pragma warning "Finish this!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam statement, nil, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  if value.IsNull then
		    
		    select case comparison.Trim
		    case "=", "IS"
		      return WhereNull( column )
		    case else
		      return WhereNotNull( column )
		    end select
		    
		  else
		    
		    select case comparison.Trim
		    case "IS"
		      comparison = "="
		    case "IS NOT" 
		      comparison = "<>"
		    end select
		    
		    return WhereRaw( column + comparison + kSQLPlaceholder, value )
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return Where( column, "=", value )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereBetween(column As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append lowValue
		  values.Append highValue
		  
		  AppendWhereParam column + " BETWEEN ? AND ?", values, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(column As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return Where( column, "IN", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNot(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam statement, nil, true, false
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotBetween(column As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim values() as variant
		  values.Append lowValue
		  values.Append highValue
		  
		  AppendWhereParam column + " NOT BETWEEN ? AND ?", values, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(column As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  return Where( column, "NOT IN", subQuery )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotNull(column As String) As SQLBuilder_MTC.WhereClause
		  return Where( column, "<>", nil )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNull(column As String) As SQLBuilder_MTC.WhereClause
		  return Where( column, "=", nil )
		  
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
		Private Tables() As String
	#tag EndProperty

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
