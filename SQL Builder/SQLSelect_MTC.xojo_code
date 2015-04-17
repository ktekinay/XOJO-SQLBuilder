#tag Class
Protected Class SQLSelect_MTC
Inherits SQLBuilder_MTC
	#tag Event
		Function CreateString() As String
		  dim builder() as string
		  
		  builder.Append "SELECT"
		  if Distinct then
		    builder.Append "DISTINCT"
		  end if
		  
		  //
		  // Columns
		  //
		  if Columns.Ubound = -1 then
		    builder.Append "*"
		  else
		    builder.Append join( Columns, ", " )
		  end if
		  
		  //
		  // From
		  //
		  if Tables.Ubound <> -1 then
		    builder.Append "FROM"
		    
		    dim tableBuilder() as string
		    for i as integer = 0 to Tables.Ubound
		      dim table as string = Tables( i )
		      dim alias as string = TableAliases( i )
		      
		      dim s as string = table
		      if alias <> "" then
		        s = s + " AS " + alias
		      end if
		      
		      tableBuilder.Append s
		    next
		    
		    builder.Append join( tableBuilder, ", " )
		  end if
		  
		  //
		  // Where
		  //
		  if WhereClause <> "" then
		    builder.Append "WHERE"
		    builder.Append WhereClause
		  end if
		  
		  //
		  // Order By
		  //
		  if OrderByColumns.Ubound <> -1 then
		    builder.Append "ORDER BY"
		    
		    dim orderBuilder() as string
		    for i as integer = 0 to OrderByColumns.Ubound
		      dim column as string = OrderByColumns( i )
		      dim direction as OrderByDirection = OrderByDirections( i )
		      
		      dim s as string = column
		      if direction = OrderByDirection.Descending then
		        s = s + " DESC"
		      end if
		      
		      orderBuilder.Append s
		    next i
		    
		    builder.Append join( orderBuilder, ", " )
		  end if
		  
		  //
		  // Limit
		  //
		  if LimitValue > 0 then
		    builder.Append "LIMIT"
		    builder.Append str( LimitValue )
		  end if
		  
		  //
		  // Offset
		  //
		  if OffSetValue > 1 then
		    builder.Append "OFFSET"
		    builder.Append str( OffsetValue )
		  end if
		  
		  dim r as string = join( builder, " " )
		  r = r.Trim
		  
		  return r
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AddColumn(ParamArray col() As String) As SQLSelect_MTC
		  return AddColumns( col )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddColumns(cols() As String) As SQLSelect_MTC
		  for i as integer = 0 to cols.Ubound
		    Columns.Append cols( i )
		  next
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(table As String, alias As String = "") As SQLSelect_MTC
		  AddTable table, alias
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Limit(rowCount As Integer) As SQLSelect_MTC
		  super.Limit( rowCount )
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Offset(startRow As Integer) As SQLSelect_MTC
		  super.Offset( startRow )
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderBy(column As String, direction As OrderByDirection = OrderByDirection.Ascending) As SQLSelect_MTC
		  super.OrderBy column, direction
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(sql As String) As SQLSelect_MTC
		  super.Where( sql )
		  return self
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Columns() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Distinct As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Distinct"
			Group="Behavior"
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
