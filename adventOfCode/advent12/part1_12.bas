
dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
dim counter2 as integer = 1
dim loadArray(93) as string
dim hDistance as integer = 0
dim vDistance as integer = 0
dim faceDirection as integer = 90
dim lineString as string
dim lineNum as integer


f = freefile

file_name = "C:/Programming/FreeBASIC/projects/Advent12/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

do
    line input #f, lineIn 'everything
    lineString = mid(lineIn, 1, 1)
    lineNum = valint(mid(lineIn, 2, 3))
    print "String: "; lineString; " "; "Number: "; lineNum
    if lineString = "N" Then
        vDistance = vDistance - lineNum
    end if
    if lineString = "S" Then
        vDistance = vDistance + lineNum
    end if
    if lineString = "E" Then
        hDistance = hDistance + lineNum
    end if
    if lineString = "W" Then
        hDistance = hDistance - lineNum
    end if
    if lineString = "R" Then
        faceDirection = faceDirection + lineNum
            if faceDirection > 359 Then
                faceDirection = faceDirection - 360
            end if
    end if
    if lineString = "L" Then
        faceDirection = faceDirection - lineNum
            if faceDirection < 1 Then
                faceDirection = faceDirection + 360
                if faceDirection = 360 then faceDirection = 0
            end if
    end if
    if lineString = "F" Then
        if faceDirection = 0 Then
            vDistance = vDistance - lineNum
        end if 
        if faceDirection = 180 Then
            vDistance = vDistance + lineNum
        end if 
        if faceDirection = 90 Then
            hDistance = hDistance + lineNum
        end if
        if faceDirection = 270 Then
            hDistance = hDistance - lineNum
        end if 
    end if
    print "Face Direction: "; faceDirection
    print "Horizontal: "; hDistance
    print "Verticle: "; vDistance
    counter1 = counter1 + 1
loop until EOF (f)

counter1 = counter1 - 1



close #f

print "Horizontal: "; hDistance
print "Verticle: "; vDistance
print "Added: "; abs(hDistance) + abs(vDistance)
