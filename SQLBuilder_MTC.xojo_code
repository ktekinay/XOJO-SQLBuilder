#tag Module
Protected Module SQLBuilder_MTC
	#tag Method, Flags = &h1
		Protected Function CondWhere(includeIf As Boolean, statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhere( includeIf, statement )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhere(includeIf As Boolean, expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhere( includeIf, expression, comparison, value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhere(includeIf As Boolean, expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhere( includeIf, expression, value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereBetween( includeIf, expression, lowValue, highValue )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereExists( includeIf, subQuery )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereIn( includeIf, expression, subQuery )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereIn( includeIf, expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereNot(includeIf As Boolean, statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereNot( includeIf, statement )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereNotBetween(includeIf As Boolean, expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondOrWhereNotBetween( includeIf, expression, lowValue, highValue )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereNotExists(includeIf As Boolean, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereNotExists( includeIf, subQuery )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereNotIn(includeIf As Boolean, expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereNotIn( includeIf, expression, subQuery )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereNotIn(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereNotIn( includeIf, expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereNotNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereNotNull( includeIf, expression )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereNull(includeIf As Boolean, expression As String) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereNull( includeIf, expression )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CondWhereRaw(includeIf As Boolean, expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.CondWhereRaw( includeIf, expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SQLSelect(expression As String, values() As Variant = Nil) As SQLBuilder_MTC.SelectClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.SQLSelect( expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SQLSelectDistinct(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.SelectClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.SQLSelectDistinct( expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Where(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.Where( statement )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Where(expression As String, comparison As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.Where( expression, comparison, value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Where(expression As String, value As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.Where( expression, value )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereBetween( expression, lowValue, highValue )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereExists(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereExists( statement )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereIn(expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereIn( expression, subQuery )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereIn( expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereNot(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereNot( statement )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereNotBetween(expression As String, lowValue As Variant, highValue As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereNotBetween( expression, lowValue, highValue )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereNotExists(statement As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereNotExists( statement )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereNotIn(expression As String, subQuery As SQLBuilder_MTC.Statement) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereNotIn( expression, subQuery )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereNotIn(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereNotIn( expression, values )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereNotNull(expression As String) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereNotNull( expression )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereNull(expression As String) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereNull( expression )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WhereRaw(expression As String, ParamArray values() As Variant) As SQLBuilder_MTC.WhereClause
		  dim s as new SQLBuilder_MTC.Statement
		  return s.WhereRaw( expression, values )
		End Function
	#tag EndMethod


	#tag Constant, Name = kSQLPlaceholder, Type = String, Dynamic = False, Default = \"\?", Scope = Public
	#tag EndConstant


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
End Module
#tag EndModule
