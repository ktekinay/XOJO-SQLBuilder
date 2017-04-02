#tag Interface
Protected Interface UnitTestInterface
	#tag Method, Flags = &h0
		Function GetTrueValues(values As Variant) As Variant()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplacePlaceHolders(sql As String, phType As SQLBuilder_MTC.PHTypes) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValuesToPlaceholders(values() As Variant) As String()
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
