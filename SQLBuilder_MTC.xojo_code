#tag Module
Protected Module SQLBuilder_MTC
	#tag Method, Flags = &h1
		Protected Function SQLSelect(ParamArray columns() As String) As SQLBuilder_MTC.FromClause
		  dim sql as new SQLBuilder_MTC.Statement
		  return sql.SQLSelect(columns)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SQLSelectDistinct(ParamArray columns() As String) As SQLBuilder_MTC.FromClause
		  dim sql as new SQLBuilder_MTC.Statement
		  return sql.SQLSelectDistinct(columns)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Where(column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim where as new SQLBuilder_MTC.Statement
		  return where.Where( column, comparison, value )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Where(column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  return Where( column, "=", value )
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
