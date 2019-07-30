def convert(matrix,step)
    locations = []
    #find all 1 locations in original matrix
    for i in 0..(matrix.length - 1)
        for j in 0..(matrix[i].length - 1)
            if matrix[i][j] == 1
                locations << [i,j]
            end
        end
    end
    
    moreLocations = []
    
    #calculate for additonal locations to convert
    locations.each do |location|
        row, column = location
        #accounting for manhattan distance

        i = 0
        until i > step
            if i == 0
                moreLocations << [(row - step),column]
                moreLocations << [(row + step),column]
                moreLocations << [row,(column + step)]
                moreLocations << [row,(column - step)]
            else
                #top
                moreLocations << [(row - (step - i)),column]
                moreLocations << [(row - (step - i)),(column + 1)]
                moreLocations << [(row - (step - i)),(column - 1)]
                #bottom
                moreLocations << [(row + (step - i)),column]
                moreLocations << [(row + (step - i)),(column + 1)]
                moreLocations << [(row + (step - i)),(column - 1)]
                #right
                moreLocations << [row,(column + (step - i))]
                moreLocations << [(row - 1),(column + (step - i))]
                moreLocations << [(row + 1),(column + (step - i))]
                #left
                moreLocations << [row,(column - (step - i))]
                moreLocations << [(row - 1),(column - (step - i))]
                moreLocations << [(row + 1),(column - (step - i))]
            end
            i += 1
        end
        
    end
    
    

    #added the additional locations to the original locations matrix, needed to loop to send one array at a time instead of pushing the entire matrix, creating only one array within locations
    for i in 0..(moreLocations.length - 1)
        locations << moreLocations[i]
    end
    #test print for proper locations
    #for i in 0..(locations.length - 1)
        #puts locations[i].join
    #end

    #using row and column again to get specific index spots to change in original matrix
    locations.each do |location|
        row, column = location
        #puts row, column
        next if row < 0 || row > matrix.length - 1 || column < 0 || column > matrix[0].length - 1
            if matrix[row][column] == 0
                matrix[row][column] = 1
            end
    end
    
    #def manhattan(current_step,index)
        #row, column = location
        #if row < 0 || row > matrix.length - 1 || column < 0 || column > matrix[0].length - 1 || current_step == 0 
            #return
        #end
        #matrix[row][column] = 1
        #manhattan(current_step - 1,[(row - 1),column])
        #manhattan(current_step - 1,[(row + 1),column])
        #manhattan(current_step - 1,[row,(column + 1)])
        #manhattan(current_step - 1,[row,(column - 1)])
    #end

    #print out in same format as matrix 
    for i in 0..(matrix.length - 1)
        puts matrix[i].join
    end
end

matrix = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1]
]

convert(matrix,3)
