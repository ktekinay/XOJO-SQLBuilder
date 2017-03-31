#tag Interface
Private Interface SelectClause
	#tag Method, Flags = &h0
		Function From(subQuery As SQLBuilder_MTC.Statement, asAlias As String, isLateral As Boolean = False) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(expression As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
