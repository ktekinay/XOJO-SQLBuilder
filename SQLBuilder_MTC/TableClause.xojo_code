#tag Interface
Private Interface TableClause
	#tag Method, Flags = &h0
		Function LeftJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
