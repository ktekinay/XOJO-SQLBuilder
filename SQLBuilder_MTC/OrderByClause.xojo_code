#tag Interface
Private Interface OrderByClause
	#tag Method, Flags = &h0
		Function OrderBy(ParamArray columnIndexes() As Integer) As SQLBuilder_MTC.OrderByClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderBy(ParamArray columnsOrExpressions() As String) As SQLBuilder_MTC.OrderByClause
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
