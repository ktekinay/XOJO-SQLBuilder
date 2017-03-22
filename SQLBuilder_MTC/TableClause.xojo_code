#tag Interface
Private Interface TableClause
	#tag Method, Flags = &h0
		Function CrossJoin(table As String) As SQLBuilder_MTC.TableClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InnerJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OuterJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightJoin(table As String, onCondition As String) As SQLBuilder_MTC.TableClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(column As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNot() As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(column As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotNull(column As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNull(column As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereRaw(sql As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
