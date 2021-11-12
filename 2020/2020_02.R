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

#V1
table[between(stringr::str_count(string = password, pattern = letter), strsplit(x = n_char, split = "-")[[1]][1], strsplit(x = n_char, split = "-")[[1]][2]), correct := 1]

#Easy but uggly solution
table[, index := 1:table[, .N]]
table[between(stringr::str_count(string = password, pattern = letter), strsplit(x = n_char, split = "-")[[index]][1], strsplit(x = n_char, split = "-")[[index]][2]), correct := 1]
#échec d'indexation au niveau deux.

#Bon c'est dommage mais bon 
btwn <- table[, strsplit(x = n_char, split = "-")]
btwn <- data.table(t(btwn)) #transposing btwn to get nice columns
table[, c("n_min", "n_max") := .(btwn[, V1], btwn[, V2])]

#Now we should be good
table[between(stringr::str_count(string = password, pattern = letter), n_min, n_max), correct := 1]

#Finish it
table[, sum(correct)]


