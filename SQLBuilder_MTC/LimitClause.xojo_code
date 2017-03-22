#tag Interface
Private Interface LimitClause
	#tag Method, Flags = &h0
		Function Limit(offset As Integer) As SQLBuilder_MTC.LimitClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Offset(offset As Integer) As SQLBuilder_MTC.LimitClause
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
