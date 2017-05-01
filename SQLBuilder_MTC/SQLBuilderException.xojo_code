#tag Class
Protected Class SQLBuilderException
Inherits RuntimeException
	#tag Method, Flags = &h0
		Sub Constructor(msg As String, methodName As String)
		  Message = msg
		  Stack.Insert 0, methodName
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
