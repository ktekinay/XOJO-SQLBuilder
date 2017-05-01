#tag Class
Private Class FromParams
	#tag Property, Flags = &h0
		AsAlias As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Expression As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		IsLateral As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		JoinExpression As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OnCondition As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		Values() As Variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AsAlias"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsLateral"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="JoinExpression"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="OnCondition"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
End Class
#tag EndClass
