#tag Interface
Private Interface FromClause
	#tag Method, Flags = &h0
		Function CrossJoin(table As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(table As String, ParamArray tables() As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InnerJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OuterJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightJoin(table As String, onCondition As String) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(includeIf As Boolean, column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Where(includeIf As Boolean, column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
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
		Function WhereRaw(includeIf As Boolean, sql As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereRaw(sql As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhereRaw(sql As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  
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
