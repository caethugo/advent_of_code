# Advent of code 2020 - 02
# I haven't tried to optimize my code, I just coded my solution the fastest and most intuitive way 
table <- fread(file = "2020/input2.csv")

#cleaning table
table <- rbind(table, data.table("4-5" = "4-5", "m:" = "m:", mmpth = "mmpth"))
setnames(table, "4-5", "n_char")
setnames(table, "m:", "letter")
setnames(table, "mmpth", "password")
table[, letter := substr(letter, 1, 1)]

#adding column correct
table[, correct := 0]
table[between(stringr::str_count(string = password, pattern = letter), strsplit(x = n_char, split = "-")[[1]][1], strsplit(x = n_char, split = "-")[[1]][2]), correct := 1]

table[, .(n_char, letter, password, stringr::str_count(string = password, pattern = letter), strsplit(x = n_char, split = "-")[[1]][1], strsplit(x = n_char, split = "-")[[1]][2])]


# for(i in 1:nrow(table)) { #loop version
#     n_char_i <- table[i, n_char] 
#     min_char_i <- strsplit(x = n_char_i, split = "-")[[1]][1]
#     max_char_i <- strsplit(x = n_char_i, split = "-")[[1]][2]
#     
#     table[min_char_i <= stringr::str_count(string = pwd_i, pattern = letter_i) <= max_char_i, correct := 1]
# }
# 
# i <- 1
# n_char_i <- table[i, n_char] #u know about the ..
# min_char_i <- strsplit(x = n_char_i, split = "-")[[1]][1]
# max_char_i <- strsplit(x = n_char_i, split = "-")[[1]][2]







    