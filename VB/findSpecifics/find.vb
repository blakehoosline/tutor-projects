Sub processEmailAddress()
    'declare variables to store the email address and "@" symbol position
    Dim email As String
    Dim atPos As Integer
    
    'prompt user for email address
    email = InputBox("Enter email address:")
    
    'find the position of the "@" symbol
    atPos = InStr(email, "@")
    
    'display "Position of @:" in cell A2
    Cells(2, 1).Value = "Position of @:"
    
    'display ordinal position of "@" symbol in cell B2
    Cells(2, 2).Value = atPos
    
    'display "User Name:" in cell A3
    Cells(3, 1).Value = "User Name:"
    
    'display text to the left of "@" symbol in cell B3
    Cells(3, 2).Value = Left(email, atPos - 1)
    
    'display "Host Name:" in cell A4
    Cells(4, 1).Value = "Host Name:"
    
    'display text to the right of "@" symbol in cell B4
    Cells(4, 2).Value = Mid(email, atPos + 1)
End Sub
