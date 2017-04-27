#tag Interface
Private Interface WhereClause
Implements StatementInterface
	#tag Method, Flags = &h0
		Function CondOrWhere(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhere(includeIf As Boolean, expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhere(includeIf As Boolean, expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereInQuery(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNot(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotInQuery(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNotNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondOrWhereRaw(includeIf As Boolean, expression As String, ParamArray values() As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereInQuery(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNot(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotInQuery(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereRaw(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Except(nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroupBy(ParamArray columns() As String) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Intersect(nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Limit(limit As Integer) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Offset(offset As Integer) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderBy(ParamArray columnIndexes() As Integer) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderBy(ParamArray expression() As String) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhere(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhere(expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhere(expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereExists(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereInQuery(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNot(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotExists(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotInQuery(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNotNull(expression As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereNull(expression As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrWhereRaw(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Prepare(db As Database) As PreparedSQLStatement
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(db As Database) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Optional phType As SQLBuilder_MTC.PHTypes) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Union(nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereExists(subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereInQuery(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNot(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotExists(subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotInQuery(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotNull(expression As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNull(expression As String) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereRaw(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
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
End Interface
#tag EndInterface
