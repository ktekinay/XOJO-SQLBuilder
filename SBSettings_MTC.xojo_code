#tag Module
Protected Module SBSettings_MTC
	#tag Constant, Name = kIncludeMSSQL, Type = Boolean, Dynamic = False, Default = \"False", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIncludeMySQL, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIncludeODBC, Type = Boolean, Dynamic = False, Default = \"False", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIncludeOracle, Type = Boolean, Dynamic = False, Default = \"False", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIncludePostgreSQL, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIncludeSQLite, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
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
