#tag Interface
Private Interface SelectClause
	#tag Method, Flags = &h0
		Function From(table As String, ParamArray tables() As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
