#tag Interface
Private Interface SelectClause
Implements StatementInterface
	#tag Method, Flags = &h0
		Function From(subQuery As SQLBuilder_MTC.StatementInterface, asAlias As String, isLateral As Boolean = False) As SQLBuilder_MTC.FromClause
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function From(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.FromClause
		  
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
		Function Prepare(db As Database) As PreparedSQLStatement
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  
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


End Interface
#tag EndInterface
