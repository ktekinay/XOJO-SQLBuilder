#tag Interface
Private Interface WhereClause
	#tag Method, Flags = &h0
		Function Where(column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereAnd() As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(column As String, subQuery As SQLBuilder_MTC.SelectClause) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNot() As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(column As String, subQuery As SQLBuilder_MTC.SelectClause) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereOr() As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereRaw(sql As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
