
dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 1
dim counter2 as integer = 1
dim loadArray(93) as string
dim ship_hDistance as integer = 0
dim ship_vDistance as integer = 0
dim way_hDistance as integer = 10
dim way_vDistance as integer = -1
dim faceDirection as integer = 90
dim hDistance as integer = 90
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
        way_vDistance = way_vDistance - lineNum
    end if
    if lineString = "S" Then
        way_vDistance = way_vDistance + lineNum
    end if
    if lineString = "E" Then
        way_hDistance = way_hDistance + lineNum
    end if
    if lineString = "W" Then
        way_hDistance = way_hDistance - lineNum
    end if
    If lineString = "R" or lineString = "L" then
        if lineString = "R" Then 'Fix this
            faceDirection = lineNum
        end if
        if lineString = "L" Then 'Fix this
            faceDirection = 360 - lineNum
        end if
        if faceDirection = 90 then
            hDistance = way_hDistance 
            way_hDistance = way_vDistance  * (-1)
            way_vDistance = hDistance
        end if
        if faceDirection = 180 then 
            way_hDistance = way_hDistance * (-1) 
            way_vDistance = way_vDistance * (-1)  
        end if
        if faceDirection = 270 then
            hDistance = way_hDistance
            way_hDistance = way_vDistance  
            way_vDistance = hDistance * (-1)
        end if
    end if
    if lineString = "F" Then
        ship_hDistance = ship_hDistance + (way_hDistance  * lineNum)
        ship_vDistance = ship_vDistance + (way_vDistance * lineNum)
    end if
    print "Face Direction: "; faceDirection
    print "Way Horizontal: "; way_hDistance
    print "Way Verticle: "; way_vDistance
    print "Horizontal: "; ship_hDistance
    print "Verticle: "; ship_vDistance
    counter1 = counter1 + 1
loop until EOF (f)

counter1 = counter1 - 1



close #f

print "Horizontal: "; ship_hDistance
print "Verticle: "; ship_vDistance
print "Added: "; abs(ship_hDistance) + abs(ship_vDistance)
