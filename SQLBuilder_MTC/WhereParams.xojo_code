#tag Class
Private Class WhereParams
Inherits SQLBuilder_MTC.Params
	#tag Property, Flags = &h0
		Expression As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		IsNOT As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		IsOR As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Values() As Variant
	#tag EndProperty


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
End Class
#tag EndClass
