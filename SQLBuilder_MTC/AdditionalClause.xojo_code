#tag Interface
Private Interface AdditionalClause
Implements StatementInterface
	#tag Method, Flags = &h0
		Function Except(nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroupBy(ParamArray columns() As String) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Having(subQuery As SQLBuilder_MTC.StatementInterface) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Having(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Intersect(nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True) As SQLBuilder_MTC.AdditionalClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Limit(offset As Integer) As SQLBuilder_MTC.AdditionalClause
		  
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
