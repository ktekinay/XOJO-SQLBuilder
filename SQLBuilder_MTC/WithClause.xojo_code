#tag Interface
Private Interface WithClause
Implements StatementInterface
	#tag Method, Flags = &h0
		Function SQLSelect(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelectDistinct(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLWith(alias As String, subQuery As SQLBuilder_MTC.StatementInterface) As WithClause
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
