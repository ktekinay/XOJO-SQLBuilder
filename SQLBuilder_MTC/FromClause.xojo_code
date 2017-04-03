#tag Interface
Private Interface FromClause
Implements StatementInterface
	#tag Method, Flags = &h0
		Function CondWhere(includeIf As Boolean, stement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
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
		Function CondWhereExists(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
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
		Function CondWhereNotExists(includeIf As Boolean, statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CondWhereNotIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
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
		Function CrossJoin(table As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(subQuery As SQLBuilder_MTC.StatementInterface, asAlias As String, isLateral As Boolean = False) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroupBy(ParamArray columns() As String) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InnerJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JoinRaw(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
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
		Function OuterJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Prepare(db As Database) As PreparedSQLStatement
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightJoin(table As String, onCondition As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
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
		Function WhereExists(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
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
		Function WhereNotExists(statement As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(expression As String, subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereNotIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
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
