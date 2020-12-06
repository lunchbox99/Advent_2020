dim f as integer
dim file_name as string
dim lineIn as string
dim counter1 as integer = 0
dim instrPointer1 as integer = 0
dim instrPointer2 as integer = 0
dim byr as string = ""
dim iyr as string = ""
dim eyr as string = ""
dim hgt as string = ""
dim hcl as string = ""
dim ecl as string = ""
dim pid as string = ""
dim cid as string = ""

f = freefile

file_name = "f:/Slow/programming/FreeBASIC-1.05.0-win64/adventOfCode/advent04/input.txt"

If( Open( file_name For Input As #f ) ) Then
   Print "ERROR: opening file " ; file_name
   End -1
End If

'function validate(upperB as integer, lowerB as integer, needle as string, hay as string) as integer

'end function


do until EOF (f)
    input #f, lineIn 'everything
    if trim(lineIn) = "" then 'process record
        if  1919 < valint(byr) and valint(byr) < 2003 then
            'print "ok byr ";
        else
            byr = ""
        end if
        if  2009 < valint(iyr) and valint(iyr) < 2021 then
            'print "ok iyr ";
        else
            iyr = ""
        end if
        if  2019 < valint(eyr) and valint(eyr) < 2031 then
            'print "ok eyr";
        else
            eyr = ""
        end if
       if instr(hgt, "cm") then
            if valint(hgt) > 149 and val(hgt) < 194 then
                'print "ok hgt ";
            else
                hgt =""
            end if
        elseif instr(hgt, "in") then
            if valint(hgt) > 58 and val(hgt) < 77 then
                'print "ok hgt ";
            else
                hgt = ""
            end if
        else
            hgt = ""
        end if
        if instr(hcl, "#") then
            if len(hcl) = 7 then
                if mid(hcl, 2) = lcase(hex(valint("&H" + mid(hcl, 2)))) then
                   ' print "ok hcl ";
                else
                    hcl = ""
                end If
            else
                hcl = ""
            end if
        else
            hcl = ""
        end if
        dim trmEcl as string = ""
        trmEcl = trim(ecl)
        if trmEcl = "amb" or trmEcl = "blu" or trmEcl = "brn" or trmEcl = "gry" or trmEcl = "grn" or trmEcl = "hzl" or trmEcl = "oth" then
            'print "ok ecl ";
        else
           ecl = ""
        end if
        if len(pid) = 9 then
            dim count as integer = 1
            dim isNum as integer = 0
            dim countNum as integer = 0
            do
                if asc(mid(pid,count,1)) > 47 and asc(mid(pid,count,1)) < 58 then
                    isNum = 1
                else
                    isNum = 0
                    pid = ""
                end if
                countNum = countNum + isNum
                count = count + 1
            loop until count = 10
            if countNum = 9 then
                'print "ok pid";
            else
                pid = ""
            end if
        else
            pid = ""
        end if
        if trim(byr) <> "" and trim(iyr) <> "" and trim(eyr) <> "" and trim(hgt) <> "" and trim(hcl) <> "" and trim(ecl) <> "" and trim(pid) <> "" then
            counter1 = counter1 + 1
            print "byr: "; byr; " iyr: "; iyr; " eyr: "; eyr; " hgt: "; hgt; " hcl: "; hcl;" ecl: "; ecl;" pid: "; pid

        end if

        byr = ""
        iyr = ""
        eyr= ""
        hgt = ""
        hcl = ""
        ecl = ""
        pid = ""
    else
        instrPointer1 = instr(instrPointer1 + 1, lineIn, "byr")
        if instrPointer1 <> 0 then
            instrPointer2 = instr(instrPointer1, lineIn, " ")
            if instrPointer2 = 0 then instrPointer2 = len(lineIn) + 1
            byr = mid(lineIn, instrPointer1 + 4, instrPointer2 - instrPointer1 - 4)
            instrPointer1 = 0
        end if
        instrPointer1 = instr(instrPointer1 + 1, lineIn, "iyr")
        if instrPointer1 <> 0 then
            instrPointer2 = instr(instrPointer1, lineIn, " ")
            if instrPointer2 = 0 then instrPointer2 = len(lineIn) + 1
            iyr = mid(lineIn, instrPointer1 + 4, instrPointer2 - instrPointer1 - 4)
            instrPointer1 = 0
        end if
        instrPointer1 = instr(instrPointer1 + 1, lineIn, "eyr")
        if instrPointer1 <> 0 then
            instrPointer2 = instr(instrPointer1, lineIn, " ")
            if instrPointer2 = 0 then instrPointer2 = len(lineIn) + 1
            eyr = mid(lineIn, instrPointer1 + 4, instrPointer2 - instrPointer1 - 4)
            instrPointer1 = 0
        end if
        instrPointer1 = instr(instrPointer1 + 1, lineIn, "hgt")
        if instrPointer1 <> 0 then
            instrPointer2 = instr(instrPointer1, lineIn, " ")
            if instrPointer2 = 0 then instrPointer2 = len(lineIn) + 1
            hgt = mid(lineIn, instrPointer1 + 4, instrPointer2 - instrPointer1 - 4)
            instrPointer1 = 0
        end if
        instrPointer1 = instr(instrPointer1 + 1, lineIn, "hcl")
        if instrPointer1 <> 0 then
            instrPointer2 = instr(instrPointer1, lineIn, " ")
            if instrPointer2 = 0 then instrPointer2 = len(lineIn) + 1
            hcl = mid(lineIn, instrPointer1 + 4, instrPointer2 - instrPointer1 - 4)
            instrPointer1 = 0
        end if
        instrPointer1 = instr(instrPointer1 + 1, lineIn, "ecl")
        if instrPointer1 <> 0 then
            instrPointer2 = instr(instrPointer1, lineIn, " ")
            if instrPointer2 = 0 then instrPointer2 = len(lineIn) + 1
            ecl = mid(lineIn, instrPointer1 + 4, instrPointer2 - instrPointer1 - 4)
            instrPointer1 = 0
        end if
        instrPointer1 = instr(instrPointer1 + 1, lineIn, "pid")
        if instrPointer1 <> 0 then
            instrPointer2 = instr(instrPointer1, lineIn, " ")
            if instrPointer2 = 0 then instrPointer2 = len(lineIn) + 1
            pid = mid(lineIn, instrPointer1 + 4, instrPointer2 - instrPointer1 - 4)
            instrPointer1 = 0
        end if
    end if

loop

        if  1919 < valint(byr) and valint(byr) < 2003 then
            'print "ok byr ";
        else
            byr = ""
        end if
        if  2009 < valint(iyr) and valint(iyr) < 2021 then
            'print "ok iyr ";
        else
            iyr = ""
        end if
        if  2019 < valint(eyr) and valint(eyr) < 2031 then
            'print "ok eyr ";
        else
            eyr = ""
        end if
       if instr(hgt, "cm") then
            if valint(hgt) > 149 and val(hgt) < 194 then
                'print "ok hgt ";
            else
                hgt =""
            end if
        elseif instr(hgt, "in") then
            if valint(hgt) > 58 and val(hgt) < 77 then
               ' print "ok hgt ";
            else
                hgt = ""
            end if
        else
            hgt = ""
        end if
        if instr(hcl, "#") then
            if len(hcl) = 7 then
                if mid(hcl, 2) = lcase(hex(valint("&H" + mid(hcl, 2)))) then
                   ' print "ok hcl ";
                else
                    hcl = ""
                end If
            else
                hcl = ""
            end if
        else
            hcl = ""
        end if
        dim trmEcl as string = ""
        trmEcl = trim(ecl)
        if trmEcl = "amb" or trmEcl = "blu" or trmEcl = "brn" or trmEcl = "gry" or trmEcl = "grn" or trmEcl = "hzl" or trmEcl = "oth" then
            'print "ok ecl ";
        else
           ecl = ""
        end if
        if len(pid) = 9 then
            dim count as integer = 1
            dim isNum as integer = 0
            dim countNum as integer = 0
            do
                if asc(mid(pid,count,1)) > 47 and asc(mid(pid,count,1)) < 58 then
                    isNum = 1
                else
                    isNum = 0
                    pid = ""
                end if
                countNum = countNum + isNum
                count = count + 1
            loop until count = 10
            if countNum = 9 then
               ' print "ok pic" ;
            else
                pid = ""
            end if
        else
            pid = ""
        end if
        if trim(byr) <> "" and trim(iyr) <> "" and trim(eyr) <> "" and trim(hgt) <> "" and trim(hcl) <> "" and trim(ecl) <> "" and trim(pid) <> "" then
            counter1 = counter1 + 1
            print "byr: "; byr; " iyr: "; iyr; " eyr: "; eyr; " hgt: "; hgt; " hcl: "; hcl;" ecl: "; ecl;" pid: "; pid
        end if



close #f

print "counter1:" ;counter1
