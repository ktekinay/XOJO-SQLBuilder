#tag Module
Protected Module SQLBuilder_MTC
	#tag Method, Flags = &h1
		Protected Function CondWhere(includeIf As Boolean = True, column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim where as new SQLBuilder_MTC.Statement
		  return where.CondWhere( includeIf, column, comparison, value )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SQLSelect(expression As String, values() As Variant = Nil) As SQLBuilder_MTC.SelectClause
		  dim sql as new SQLBuilder_MTC.Statement
		  return sql.SQLSelect( expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SQLSelectDistinct(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  dim sql as new SQLBuilder_MTC.Statement
		  return sql.SQLSelectDistinct( expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Where(column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim where as new SQLBuilder_MTC.Statement
		  return where.Where( column, comparison, value )
		  
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kSQLPlaceholder, Type = String, Dynamic = False, Default = \"\?", Scope = Public
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
