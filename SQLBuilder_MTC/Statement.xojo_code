#tag Class
Protected Class Statement
Implements FromClause, TableClause, WhereClause, LimitClause, OrderByClause, HavingClause, GroupByClause
	#tag Method, Flags = &h21
		Private Sub AppendToArray(appendTo() As String, fromArr() As String)
		  for i as integer =0 to fromArr.Ubound
		    appendTo.Append fromArr( i )
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CrossJoin(table As String) As SQLBuilder_MTC.TableClause
		  Tables.Append "CROSS JOIN " + table 
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoSQLSelect(columns() As String)
		  AppendToArray self.Columns, columns
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(tables() As String) As SQLBuilder_MTC.TableClause
		  AppendToArray self.Tables, tables
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(table As String, ParamArray tables() As String) As SQLBuilder_MTC.TableClause
		  self.Tables.Append table
		  AppendToArray self.Tables, tables
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  Tables.Append "FULL JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroupBy(ParamArray columns() As String) As SQLBuilder_MTC.GroupByClause
		  AppendToArray GroupBys, columns
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Having(ParamArray conditions() As String) As SQLBuilder_MTC.HavingClause
		  AppendToArray Havings, conditions
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InnerJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  Tables.Append "INNER JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  Tables.Append "JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  Tables.Append "LEFT JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Limit(limit As Integer) As SQLBuilder_MTC.LimitClause
		  SQLLimit.Limit = limit
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NextParameter(appendValue As Variant) As String
		  Values.Append appendValue
		  
		  select case Db
		  case isa MySQLCommunityServer
		    return "?"
		    
		  case else
		    return "$" + str( Values.Ubound + 1 )
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Offset(offset As Integer) As SQLBuilder_MTC.LimitClause
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
		Function OrderBy(ParamArray columnIndexes() As Integer) As SQLBuilder_MTC.OrderByClause
		  for i as integer = 0 to columnIndexes.Ubound
		    OrderBys.Append str( columnIndexes( i ) )
		  next
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderBy(ParamArray columnsOrExpressions() As String) As SQLBuilder_MTC.OrderByClause
		  AppendToArray OrderBys, columnsOrExpressions
		  
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OuterJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  Tables.Append "OUTER JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  Tables.Append "RIGHT JOIN " + table + " ON (" + onCondition + ")"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(columns() As String) As SQLBuilder_MTC.FromClause
		  OperationType = "SELECT"
		  DoSQLSelect columns
		  
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(ParamArray columns() As String) As SQLBuilder_MTC.FromClause
		  return SQLSelect( columns )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelectDistinct(ParamArray columns() As String) As SQLBuilder_MTC.FromClause
		  return SQLSelectDistinct( columns )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelectDistinct(columns() As String) As SQLBuilder_MTC.FromClause
		  OperationType = "SELECT DISTINCT"
		  DoSQLSelect columns
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  dim builder() as string
		  
		  if OperationType <> "" then
		    builder.Append OperationType
		    builder.Append EndOfLine
		    
		    select case OperationType
		    case "SELECT"
		      if Columns.Ubound = -1 then
		        builder.Append "*"
		      else
		        builder.Append join( Columns, "," + EndOfLine )
		      end if
		      
		    end select
		    
		  end if
		  
		  builder.Append EndOfLine
		  
		  if Tables.Ubound <> -1 then
		    builder.Append "FROM"
		    builder.Append EndOfLine
		    
		    builder.Append join( tables, "," + EndOfLine )
		    builder.Append EndOfLine
		  end if
		  
		  
		  if WhereConditions.Ubound <> -1 then
		    builder.Append "WHERE"
		    builder.Append EndOfLine
		    
		    for i as integer = 0 to WhereConditions.Ubound
		      builder.Append WhereConditions( i ).StringValue
		      builder.Append EndOfLine
		    next
		  end if
		  
		  return join( builder, "" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  WhereConditions.Append statement
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  comparison = comparison.Trim
		  
		  if value.IsNull then
		    
		    select case comparison
		    case "<", ">", "<>", "!=", "is not"
		      WhereConditions.Append column + " IS NOT NULL"
		      
		    case else
		      WhereConditions.Append column + " IS NULL"
		      
		    end select
		    
		  else
		    
		    if comparison = "" then
		      comparison = "="
		    end if
		    
		    WhereConditions.Append column + " " + comparison + " " + NextParameter( value )
		    
		  end if
		  
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return Where( column, "=", value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereAnd() As SQLBuilder_MTC.WhereClause
		  WhereConditions.Append "AND"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(column As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  WhereConditions.Append column + " IN (" 
		  WhereConditions.Append subQuery
		  WhereConditions.Append ")"
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNot() As SQLBuilder_MTC.WhereClause
		  WhereConditions.Append "NOT"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(column As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  WhereConditions.Append column + " NOT IN (" 
		  WhereConditions.Append subQuery
		  WhereConditions.Append ")"
		  
		  return self
		  
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
		Function WhereOr() As SQLBuilder_MTC.WhereClause
		  WhereConditions.Append "OR"
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereRaw(sql As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  WhereConditions.Append "(" + sql + ")"
		  for i as integer = 0 to values.Ubound
		    self.Values.Append values(i)
		  next
		  
		  return self
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Columns() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Db As Database
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GroupBys() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Havings() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOperationType As String
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
		Private Values() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WhereConditions() As Variant
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
