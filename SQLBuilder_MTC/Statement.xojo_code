#tag Class
Protected Class Statement
Implements WhereClause,SelectClause,FromClause,AdditionalClause,UnitTestInterface,WithClause,StatementInterface
	#tag Method, Flags = &h21
		Private Sub AppendFromParam(isLateral As Boolean, expression As Variant, asAlias As String, joinExpression As String, onCondition As Variant, values() As Variant)
		  dim f as new SQLBuilder_MTC.FromParams
		  
		  f.IsLateral = isLateral
		  f.Expression = expression
		  f.AsAlias = asAlias.Trim
		  f.JoinExpression = joinExpression.Trim
		  f.OnCondition = onCondition
		  AppendToVariantArray f.Values, GetTrueValues( values )
		  
		  FromParams.Append f
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendHavingParam(expression As Variant, values() As Variant)
		  dim h as new SQLBuilder_MTC.HavingParams
		  h.Expression = expression
		  AppendToVariantArray h.Values, GetTrueValues( values )
		  Havings.Append h
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendLineToStringBuilder(stringBuilder() As String, indent As String, ParamArray items() As String)
		  stringBuilder.Append indent
		  for i as integer = 0 to items.Ubound
		    stringBuilder.Append items( i ).Trim
		    if i < items.Ubound then
		      stringBuilder.Append " "
		    end if
		  next
		  stringBuilder.Append EndOfLine
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendNextStatement(type As String, statement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean)
		  dim ns as new SQLBuilder_MTC.NextStatementParams
		  ns.Type = type
		  ns.Statement = SQLBuilder_MTC.Statement( statement )
		  ns.IsDistinct = isDistinct
		  NextStatements.Append ns
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendSelectParam(expression As String, values() As Variant)
		  expression = expression.Trim
		  if expression = "" then
		    expression = "*"
		  end if
		  
		  dim s as new SQLBuilder_MTC.SelectParams
		  s.Expression = expression
		  s.Values = GetTrueValues( values )
		  SelectParams.Append s
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
		Private Sub AppendToVariantArray(appendTo() As Variant, fromArr() As Variant)
		  if fromArr is nil then
		    return
		  end if
		  
		  for i as integer = 0 to fromArr.Ubound
		    appendTo.Append fromArr( i )
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendWhereParam(expression As Variant, values() As Variant, isNOT As Boolean, isOR As Boolean)
		  dim p as new SQLBuilder_MTC.WhereParams
		  p.Expression = expression
		  AppendToVariantArray p.Values, GetTrueValues( values )
		  
		  p.IsNOT = isNOT
		  p.IsOR = isOR
		  
		  WhereParams.Append p
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildFromClause(indent As String, stringBuilder() As String, values() As Variant)
		  if FromParams.Ubound = -1 then
		    return
		  end if
		  
		  for i as integer = 0 to FromParams.Ubound
		    dim f as SQLBuilder_MTC.FromParams = FromParams( i )
		    
		    //
		    // We can't use AppendLineToStringBuilder here, unfortunately
		    //
		    if f.JoinExpression = "" and i > 0 then
		      stringBuilder.Append ","
		    end if
		    
		    if i > 0 then
		      stringBuilder.Append EndOfLine
		    end if
		    
		    stringBuilder.Append indent
		    
		    if f.IsLateral then
		      stringBuilder.Append "LATERAL "
		    end if
		    
		    if f.JoinExpression <> "" then
		      stringBuilder.Append f.JoinExpression
		      stringBuilder.Append " "
		    end if
		    
		    if f.Expression isa SQLBuilder_MTC.Statement then
		      dim sb as SQLBuilder_MTC.Statement = f.Expression
		      stringBuilder.Append "("
		      stringBuilder.Append EndOfLine
		      sb.BuildSQL indent + kIndentString, stringBuilder, values
		      stringBuilder.Append indent
		      stringBuilder.Append ") AS "
		      stringBuilder.Append f.AsAlias
		      
		    elseif f.Expression.Type = Variant.TypeString then
		      stringBuilder.Append f.Expression.StringValue
		      if f.AsAlias <> "" then
		        stringBuilder.Append " AS "
		        stringBuilder.Append f.AsAlias
		      end if
		    end if
		    
		    if f.OnCondition isa SQLBuilder_MTC.Statement or f.OnCondition.StringValue <> "" then
		      stringBuilder.Append " ON ("
		      if f.OnCondition isa SQLBuilder_MTC.Statement then
		        stringBuilder.Append EndOfLine
		        dim sb as SQLBuilder_MTC.Statement = f.OnCondition
		        sb.BuildSQL indent + kIndentString, stringBuilder, values
		        stringBuilder.Append EndOfLine
		        stringBuilder.Append indent
		      else
		        stringBuilder.Append f.OnCondition.StringValue.Trim
		      end if
		      stringBuilder.Append ")"
		    end if
		    
		    AppendToVariantArray values, f.Values
		  next i
		  
		  stringBuilder.Append EndOfLine
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildGroupByClause(indent As String, stringBuilder() As String)
		  if GroupBys.Ubound = -1 then
		    return
		  end if
		  
		  for i as integer = 0 to GroupBys.Ubound
		    AppendLineToStringBuilder stringBuilder, indent, GroupBys( i ) + if( i < GroupBys.Ubound, ",", "" )
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildHavingClause(indent As String, stringBuilder() As String, values() As Variant)
		  if Havings.Ubound = -1 then
		    return
		  end if
		  
		  for i as integer = 0 to Havings.Ubound
		    if i > 0 then
		      StringBuilder.Append ","
		      StringBuilder.Append EndOfLine
		    end if
		    
		    dim h as SQLBuilder_MTC.HavingParams = Havings( i )
		    
		    if h.Expression.Type = Variant.TypeString then
		      stringBuilder.Append indent
		      stringBuilder.Append h.Expression.StringValue
		      AppendToVariantArray values, h.Values
		    elseif h.Expression isa SQLBuilder_MTC.Statement then
		      dim subQuery as SQLBuilder_MTC.Statement = h.Expression
		      AppendLineToStringBuilder stringBuilder, indent, "("
		      subQuery.BuildSQL indent + kIndentString, stringBuilder, values
		      stringBuilder.Append indent
		      stringBuilder.Append ")"
		      //
		      // No values
		      //
		    end if
		  next
		  
		  StringBuilder.Append EndOfLine
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildOrderByClause(indent As String, stringBuilder() As String)
		  if OrderBys.Ubound = -1 then
		    return
		  end if
		  
		  for i as integer = 0 to OrderBys.Ubound
		    AppendLineToStringBuilder stringBuilder, indent, orderBys( i ) + if( i < orderBys.Ubound, ",", "" )
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildSelectClause(indent As String, stringBuilder() As String, values() As Variant)
		  for i as integer = 0 to SelectParams.Ubound
		    dim p as SQLBuilder_MTC.SelectParams = SelectParams( i )
		    if p.Expression = "" then
		      p.Expression = "*"
		    end if
		    AppendLineToStringBuilder stringBuilder, indent, p.Expression + _
		    if( i < SelectParams.Ubound, ", ", "" )
		    AppendToVariantArray values, p.Values
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildSQL(indent As String, stringBuilder() As String, values() As Variant)
		  //
		  // With
		  //
		  BuildWithClause indent, stringBuilder, values
		  
		  //
		  // If there is a next statement, have to wrap this in parens
		  //
		  dim origIndent as string = indent
		  if NextStatements.Ubound <> -1 then
		    AppendLineToStringBuilder stringBuilder, indent, "("
		    indent = indent + kIndentString
		  end if
		  
		  dim nextIndent as string = indent + kIndentString
		  
		  select case OperationType
		  case ""
		    //
		    // It's a partial statement
		    //
		    
		  case "SELECT", "SELECT DISTINCT"
		    AppendLineToStringBuilder stringBuilder, indent, OperationType
		    BuildSelectClause nextIndent, stringBuilder, values
		    
		  case else
		    raise new SQLBuilder_MTC.SQLBuilderException( "The " + OperationType + " operation is not yet supported", CurrentMethodName )
		    
		  end select
		  
		  //
		  // From
		  //
		  if FromParams.Ubound <> -1 then
		    AppendLineToStringBuilder stringBuilder, indent, "FROM"
		    BuildFromClause nextIndent, stringBuilder, values
		  end if
		  
		  //
		  // Where
		  //
		  if WhereParams.Ubound <> -1 then
		    //
		    // See if we have to prefix WHERE as this might only be a where statement
		    //
		    if OperationType <> "" then
		      AppendLineToStringBuilder stringBuilder, indent, "WHERE"
		      BuildWhereClause nextIndent, stringBuilder, values
		    else
		      BuildWhereClause indent, stringBuilder, values
		    end if
		  end if
		  
		  //
		  // Group By
		  //
		  if GroupBys.Ubound <> -1 then
		    AppendLineToStringBuilder stringBuilder, indent, "GROUP BY"
		    BuildGroupByClause nextIndent, stringBuilder
		  end if
		  
		  //
		  // Having
		  //
		  if Havings.Ubound <> -1 then
		    AppendLineToStringBuilder stringBuilder, indent, "HAVING"
		    BuildHavingClause nextIndent, stringBuilder, values
		  end if
		  
		  //
		  // Order By
		  //
		  if OrderBys.Ubound <> -1 then
		    AppendLineToStringBuilder stringBuilder, indent, "ORDER BY"
		    BuildOrderByClause nextIndent, stringBuilder
		  end if
		  
		  //
		  // Additional
		  //
		  if LimitParams.Limit > 0 then
		    AppendLineToStringBuilder stringBuilder, indent, "LIMIT", str( LimitParams.Limit )
		  end if
		  
		  if LimitParams.Offset > 0 then
		    AppendLineToStringBuilder stringBuilder, indent, "OFFSET", str( LimitParams.OFFSET )
		  end if
		  
		  //
		  // So the next statements if any
		  //
		  if nextStatements.Ubound <> -1 then
		    indent = origIndent
		    nextIndent = indent + kIndentString
		    
		    for i as integer = 0 to nextStatements.Ubound
		      dim ns as SQLBuilder_MTC.NextStatementParams = NextStatements( i )
		      
		      AppendLineToStringBuilder stringBuilder, indent, ") " + ns.Type + _
		      if( ns.IsDistinct, "", " ALL" ) + " ("
		      ns.Statement.BuildSQL nextIndent, stringBuilder, values
		    next i
		    AppendLineToStringBuilder stringBuilder, indent, ")"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildWhereClause(indent As String, stringBuilder() As String, values() As Variant)
		  dim nextIndent as string = indent + kIndentString
		  
		  for i as integer = 0 to WhereParams.Ubound
		    dim w as SQLBuilder_MTC.WhereParams = WhereParams( i )
		    
		    stringBuilder.Append indent
		    
		    if i > 0 then
		      if w.IsOR then
		        stringBuilder.Append "OR "
		      else
		        stringBuilder.Append "AND "
		      end if
		    end if
		    
		    if w.IsNOT then
		      stringBuilder.Append "NOT "
		    end if
		    
		    if w.Expression.Type = Variant.TypeString then
		      stringBuilder.Append w.Expression
		    end if
		    
		    dim subQuery as SQLBuilder_MTC.Statement
		    if w.Expression isa SQLBuilder_MTC.Statement then
		      subQuery = w.Expression
		      //
		      // There won't be values
		      //
		    elseif w.Values.Ubound = 0 and w.Values( 0 ) isa SQLBuilder_MTC.Statement then
		      subQuery = w.Values( 0 )
		      //
		      // Still won't be values
		      //
		    end if
		    
		    if subQuery is nil then
		      stringBuilder.Append EndOfLine
		      AppendToVariantArray values, w.Values
		    else
		      stringBuilder.Append "("
		      stringBuilder.Append EndOfLine
		      subQuery.BuildSQL nextIndent, stringBuilder, values
		      AppendLineToStringBuilder stringBuilder, indent, ")"
		    end if
		    
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildWithClause(indent As String, stringBuilder() As String, values() As Variant)
		  for i as integer = 0 to WithParams.Ubound
		    dim p as SQLBuilder_MTC.WithParams = WithParams( i )
		    
		    AppendLineToStringBuilder stringBuilder, indent, "WITH", p.Alias, "AS ("
		    
		    if p.SubQuery isa object then
		      p.SubQuery.BuildSql indent + kIndentString, stringBuilder, values
		      stringBuilder.Append EndOfLine
		    end if
		    
		    AppendLineToStringBuilder stringBuilder, indent, ")"
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhere(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function CondOrWhereExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereExists( subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function CondOrWhereNot(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function CondOrWhereNotExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNotExists( subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function CondOrWhereNotNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNotNull( expression )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return OrWhereNull( expression )
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
		Function CondWhere(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function CondWhereExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereExists( subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function CondWhereNot(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function CondWhereNotExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereNotExists( subQuery )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		  if includeIf then
		    return WhereNotNull( expression )
		  else
		    return self
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  if includeIf then
		    return WhereNull( expression )
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
		  AppendFromParam false, table, "", "CROSS JOIN", "", nil
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Except(nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True) As SQLBuilder_MTC.AdditionalClause
		  AppendNextStatement "EXCEPT", nextStatement, isDistinct
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(subQuery As SQLBuilder_MTC.StatementInterface, asAlias As String, isLateral As Boolean = False) As SQLBuilder_MTC.FromClause
		  AppendFromParam isLateral, subQuery, asAlias, "", "", nil
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, expression, "", "", "", values
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullJoin(table As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "FULL JOIN", subQuery, nil
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "FULL JOIN", onCondition, values
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
		Function Having(subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.AdditionalClause
		  AppendHavingParam subQuery, nil
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Having(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.AdditionalClause
		  AppendHavingParam expression, values
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InnerJoin(table As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "INNER JOIN", SubQuery, nil
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InnerJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "INNER JOIN", onCondition, values
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Intersect(nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True) As SQLBuilder_MTC.AdditionalClause
		  AppendNextStatement "INTERSECT", nextStatement, isDistinct
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(table As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "JOIN", subQuery, nil
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "JOIN", onCondition, values
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JoinRaw(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, "", "", expression, "", values
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftJoin(table As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "LEFT JOIN", subQuery, nil
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "LEFT JOIN", onCondition, values
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Limit(limit As Integer) As SQLBuilder_MTC.AdditionalClause
		  LimitParams.Limit = limit
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Offset(offset As Integer) As SQLBuilder_MTC.AdditionalClause
		  LimitParams.Offset = offset
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
		Function OrWhere(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam statement, nil, false, true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhere(expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  expression = expression.Trim
		  comparison = comparison.Trim
		  
		  if comparison = "" then
		    comparison = "="
		  end if
		  
		  if value.IsNull then
		    
		    select case comparison.Trim
		    case "=", "IS"
		      return OrWhereNull( expression )
		    case else
		      return OrWhereNotNull( expression )
		    end select
		    
		  else
		    
		    select case comparison.Trim
		    case "IS"
		      comparison = "="
		    case "IS NOT" 
		      comparison = "<>"
		    end select
		    
		    dim raw() as string
		    if expression <> "" then
		      raw.Append expression
		    end if
		    raw.Append comparison
		    if value isa SQLBuilder_MTC.Statement then
		      raw.Append "" // Adds a space
		    else
		      raw.Append kSQLPlaceholder
		    end if
		    
		    return OrWhereRaw( join( raw, " " ), value )
		    
		  end if
		  
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
		  
		  AppendWhereParam expression + " BETWEEN ? AND ?", values, false, true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereExists(subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  return OrWhere( "", "EXISTS", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereIn(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function OrWhereNot(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function OrWhereNotExists(subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  return OrWhere( "", "NOT EXISTS", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotIn(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function OrWhereNotNull(expression As String) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam expression + " IS NOT NULL", nil, false, true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNull(expression As String) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam expression + " IS NULL", nil, false, true
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
		Function OuterJoin(table As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "OUTER JOIN", subQuery, nil
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OuterJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "OUTER JOIN", onCondition, values
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Prepare(db As Database) As PreparedSQLStatement
		  dim values() as variant
		  dim phType as SQLBuilder_MTC.PHTypes = SQLBuilder_MTC.PHTypeOfDatabase( db )
		  
		  dim sql as string = ToString( phType, values )
		  
		  dim ps as PreparedSQLStatement = db.Prepare( sql )
		  for i as integer = 0 to values.Ubound
		    dim v as variant = values( i )
		    ps.Bind i, v
		    if not ( db isa PostgreSQLDatabase ) then
		      dim bindType as integer = ValueToBindType( v, db )
		      ps.BindType i, bindType
		    end if
		  next
		  
		  return ps
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReplacePlaceHolders(sql As String, phType As SQLBuilder_MTC.PHTypes) As String
		  if phType = SQLBuilder_MTC.PHTypes.QuestionMark then
		    return sql
		  end if
		  
		  dim placeholderPrefix as string
		  select case phType
		  case SQLBuilder_MTC.PHTypes.QuestionMarkNumber
		    placeholderPrefix = "?"
		  case SQLBuilder_MTC.PHTypes.ColonName
		    placeholderPrefix = ":"
		  case SQLBuilder_MTC.PHTypes.DollarSignNumber
		    placeholderPrefix = "$"
		  case else
		    raise new SQLBuilderException( "Unknown placeholder type", CurrentMethodName )
		  end select
		  dim nextPlaceholderIndex as integer = 1
		  
		  dim chars() as string = sql.Split( "" )
		  dim inQuote as boolean
		  dim quoteChar as string
		  
		  for charIndex as integer = 0 to chars.Ubound
		    dim char as string = chars( charIndex )
		    
		    if inQuote then
		      if char = quoteChar then
		        quoteChar = ""
		        inQuote = false
		      end if
		      
		    else // not inQuote
		      select case char
		      case """", "'", "`"
		        quoteChar = char
		        inQuote = true
		        
		      case SQLBuilder_MTC.kSQLPlaceholder
		        chars( charIndex ) = placeholderPrefix + str( nextPlaceholderIndex )
		        nextPlaceholderIndex = nextPlaceholderIndex + 1
		        
		      end select
		    end if
		  next
		  
		  dim result as string = join( chars, "" )
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightJoin(table As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "RIGHT JOIN", subQuery, nil
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  AppendFromParam false, table, "", "RIGHT JOIN", onCondition, values
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  OperationType = "SELECT"
		  AppendSelectParam expression, values
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelectDistinct(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  OperationType = "SELECT DISTINCT"
		  AppendSelectParam expression, values
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLWith(alias As String, subQuery As SQLBuilder_MTC.StatementInterface) As WithClause
		  dim w as new SQLBuilder_MTC.WithParams
		  
		  w.SubQuery = SQLBuilder_MTC.Statement( subQuery )
		  w.Alias = alias
		  WithParams.Append w
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(db As Database) As String
		  dim phType as SQLBuilder_MTC.PHTypes = SQLBuilder_MTC.PHTypes.QuestionMark
		  
		  if db isa object then
		    phType = SQLBuilder_MTC.PHTypeOfDatabase( db )
		  end if
		  
		  return ToString( phType )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(phType As SQLBuilder_MTC.PHTypes = SQLBuilder_MTC.PHTypes.QuestionMark) As String
		  dim values() as variant
		  return ToString( phType, values )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ToString(phType As SQLBuilder_MTC.PHTypes, values() As Variant) As String
		  dim stringBuilder() as string
		  
		  BuildSQL "", stringBuilder, values
		  
		  dim sql as string = join( stringBuilder, "" )
		  sql = ReplacePlaceHolders( sql, phType )
		  return sql
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Union(nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True) As SQLBuilder_MTC.AdditionalClause
		  AppendNextStatement "UNION", nextStatement, isDistinct
		  return self
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

	#tag Method, Flags = &h21
		Private Function ValueToBindType(ByRef value As Variant, db As Database) As Integer
		  dim type as integer = -1
		  
		  select case db
		  case isa SQLiteDatabase
		    select case value.Type
		    case Variant.TypeBoolean
		      type = SQLitePreparedStatement.SQLITE_BOOLEAN
		    case Variant.TypeDate
		      value = value.DateValue.SQLDateTime
		      type = SQLitePreparedStatement.SQLITE_TEXT
		    case Variant.TypeDouble, Variant.TypeSingle
		      type = SQLitePreparedStatement.SQLITE_DOUBLE
		    case Variant.TypeInt64, Variant.TypeInt32, Variant.TypeInteger
		      type = SQLitePreparedStatement.SQLITE_INTEGER
		    case Variant.TypeNil
		      type = SQLitePreparedStatement.SQLITE_NULL
		    case Variant.TypeString, Variant.TypeText
		      type = SQLitePreparedStatement.SQLITE_TEXT
		    case else
		      type = SQLitePreparedStatement.SQLITE_BLOB
		    end select
		    
		  case isa MySQLCommunityServer
		    select case value.Type
		    case Variant.TypeBoolean
		      value = if( value.BooleanValue, 1, 0 )
		      type = MySQLPreparedStatement.MYSQL_TYPE_TINY
		    case Variant.TypeDate
		      type = MySQLPreparedStatement.MYSQL_TYPE_DATETIME
		    case Variant.TypeDouble, Variant.TypeSingle
		      type = MySQLPreparedStatement.MYSQL_TYPE_DOUBLE
		    case Variant.TypeInt64
		      type = MySQLPreparedStatement.MYSQL_TYPE_LONGLONG
		    case Variant.TypeInt32, Variant.TypeInteger
		      type = MySQLPreparedStatement.MYSQL_TYPE_LONG
		    case Variant.TypeNil
		      type = MySQLPreparedStatement.MYSQL_TYPE_NULL
		    case Variant.TypeString, Variant.TypeText
		      type = MySQLPreparedStatement.MYSQL_TYPE_STRING
		    case else
		      type = MySQLPreparedStatement.MYSQL_TYPE_BLOB
		    end select
		    
		  case isa MSSQLServerDatabase
		    raise new SQLBuilder_MTC.SQLBuilderException( "MSSQLServerDatabase is not yet supported", CurrentMethodName )
		    
		  case isa PostgreSQLDatabase
		    //
		    // Do nothing
		    //
		    
		  case isa ODBCDatabase
		    raise new SQLBuilder_MTC.SQLBuilderException( "ODBCDatabase is not yet supported", CurrentMethodName )
		    
		  case isa OracleDatabase
		    raise new SQLBuilder_MTC.SQLBuilderException( "OracleDatabase is not yet supported", CurrentMethodName )
		    
		  end select
		  
		  return type
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam statement, nil, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  expression = expression.Trim
		  comparison = comparison.Trim
		  
		  if comparison = "" then
		    comparison = "="
		  end if
		  
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
		    
		    dim raw() as string
		    if expression <> "" then
		      raw.Append expression
		    end if
		    raw.Append comparison
		    if value isa SQLBuilder_MTC.Statement then
		      raw.Append "" // Adds a space
		    else
		      raw.Append kSQLPlaceholder
		    end if
		    
		    return WhereRaw( join( raw, " " ), value )
		    
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
		Function WhereExists(subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  return Where( "", "EXISTS", subQuery )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function WhereNot(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		Function WhereNotExists(subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  return Where( "", "NOT EXISTS", subQuery )
		  
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
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
		  AppendWhereParam expression + " IS NOT NULL", nil, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNull(expression As String) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam expression + " IS NULL", nil, false, false
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereRaw(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  AppendWhereParam expression, values, false, false
		  
		  return self
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Information
		
		Loosely based on concepts inplemented in:
		
		http://knexjs.org/
	#tag EndNote


	#tag Property, Flags = &h21
		Private FromParams() As SQLBuilder_MTC.FromParams
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GroupBys() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Havings() As SQLBuilder_MTC.HavingParams
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if mLimitParams is nil then
			    mLimitParams = new LimitParams
			  end if
			  
			  return mLimitParams
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLimitParams = value
			End Set
		#tag EndSetter
		Private LimitParams As SQLBuilder_MTC.LimitParams
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Attributes( hidden ) Private mLimitParams As SQLBuilder_MTC.LimitParams
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( hidden ) Private mOperationType As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NextStatements() As SQLBuilder_MTC.NextStatementParams
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
			    if  mOperationType.Left( 5 ) <> value.Left( 5 ) then
			      //
			      // It was already selected, so this is an error
			      //
			      dim err as new SQLBuilderException( "You can only use one operation type", CurrentMethodName )
			      raise err
			    end if
			    
			  else
			    mOperationType = value
			  end if
			  
			  
			End Set
		#tag EndSetter
		Private OperationType As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private OrderBys() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectParams() As SQLBuilder_MTC.SelectParams
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ToString( nil )
			  
			  
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private WhereParams() As SQLBuilder_MTC.WhereParams
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WithParams() As WithParams
	#tag EndProperty


	#tag Constant, Name = kIndentString, Type = String, Dynamic = False, Default = \"  ", Scope = Private
	#tag EndConstant


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
