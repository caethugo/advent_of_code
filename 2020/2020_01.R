# 2020 - 1 - find couple (x,y) verifying x+y = 2020 and multiply them.
library(data.table)

input <- fread(file = "advent_input.csv")

for(i in 1:input[, .N]) {
  for(j in 1:input[, .N]) {
    if(input[i, V1] + input[j, V1] == 2020) {
      indices <- c(i, j)
    }
  }
}
indices
