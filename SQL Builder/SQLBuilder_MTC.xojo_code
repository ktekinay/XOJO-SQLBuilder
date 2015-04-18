#tag Class
Protected Class SQLBuilder_MTC
	#tag Method, Flags = &h1
		Protected Sub AddTable(table As String, alias As String)
		  Tables.Append table.Trim
		  TableAliases.Append alias.Trim
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AppendLimitClause(toArr() As String)
		  if LimitValue > 0 then
		    toArr.Append "LIMIT"
		    toArr.Append str( LimitValue )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AppendOffsetClause(toArr() As String)
		  if OffsetValue > 1 then
		    toArr.Append "OFFSET"
		    toArr.Append str( OffsetValue )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AppendOrderByClause(toArr() As String)
		  if orderByColumns.Ubound = -1 then
		    return
		  end if
		  
		  toArr.Append "ORDER BY"
		  
		  dim orderBuilder() as string
		  for i as integer = 0 to OrderByColumns.Ubound
		    dim column as string = OrderByColumns( i )
		    dim direction as SQLDirection = OrderByDirections( i )
		    
		    dim s as string = column
		    if direction = SQLDirection.Descending then
		      s = s + " DESC"
		    end if
		    
		    orderBuilder.Append s
		  next i
		  
		  toArr.Append join( orderBuilder, ", " )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AppendWhereClause(toArr() As String)
		  if WhereClause <> "" then
		    toArr.Append "WHERE"
		    toArr.Append WhereClause
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // Cannot instantiate directly
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Limit(value As Integer)
		  LimitValue = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Offset(value As Integer)
		  OffsetValue = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub OrderBy(column As String, direction As SQLDirection)
		  OrderByColumns.Append column.Trim
		  OrderByDirections.Append direction
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SQLSelect(ParamArray columns() As String) As SQLSelect_MTC
		  dim sql as new SQLSelect_MTC
		  return sql.AddColumns( columns )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SQLSelectDistinct(ParamArray columns() As String) As SQLSelect_MTC
		  dim sql as new SQLSelect_MTC
		  sql.Distinct = true
		  return sql.AddColumns( columns )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Where(sql As String)
		  //
		  // Override in the subclass and typecast
		  //
		  
		  WhereClause = sql.Trim
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CreateString() As String
	#tag EndHook


	#tag Property, Flags = &h1
		Protected LimitValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OffsetValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OrderByColumns() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OrderByDirections() As SQLDirection
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TableAliases() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Tables() As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return RaiseEvent CreateString()
			End Get
		#tag EndGetter
		ToString As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected WhereClause As String
	#tag EndProperty


	#tag Enum, Name = SQLDirection, Flags = &h0
		Ascending
		Descending
	#tag EndEnum


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
		#tag ViewProperty
			Name="ToString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
