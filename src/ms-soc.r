# load source files
source("utils.r")
source("init.r")


# design matrix
# soc_design_mat <- cbind(1, refl_mat)

# calculate mlr variance and inverse values
# mlr_var <- mlr.var(soc_vec, soc_design_mat)
# inv_mlr_var <- 1.0 / mlr_var

# use simulated annealing for model selection
# time_1 <- proc.time()
# sa_idx_vec <- ms.sa(soc_vec, soc_design_mat, inv_mlr_var)
# time_2 <- proc.time()
# sa_idx_vec <- sort(sa_idx_vec)
# sa_idx_cp <- mallows.cp(soc_vec, soc_design_mat, sa_idx_vec, inv_mlr_var)

# output
# sa_idx_vec
# sa_idx_cp
# length(sa_idx_vec)
# time_2-time_1

# write.csv(sa_idx_vec, "../pro-files/data/gen/ms-sa-soc-idx-vec.csv", col.names = FALSE, row.names = FALSE)

mlr.init(soc_vec, soc_design_mat)

t1 <- proc.time()
print(idx_vec <- sort(ms.sa(idx_vec=1)))
t2 <- proc.time()

print("mallows' cp:")
ms.cp(idx_vec)
print("time:")
t2-t1

wl_idx_vec <- (idx_vec-1)[-1]
print(wl_idx_vec)

data <- read.csv("../pro-files/data/soil-spec-rnd.csv",sep="\t",header=F)
new_data <- as.matrix(data[wl_idx_vec,])



# print(new_data)
# write.table(new_data, "../pro-files/data/gen/ms-sa-soc-spec-rnd.csv", sep="\t", col.names=F,row.names=F)