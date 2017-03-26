#tag Interface
Private Interface WhereClause
Implements AdditionalClause
	#tag Method, Flags = &h0
		Function AndWhere(includeIf As Boolean, column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AndWhere(includeIf As Boolean, column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AndWhere(column As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AndWhere(column As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  
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
