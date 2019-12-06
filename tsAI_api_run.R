pr <- plumber::plumb("/tsAI_api.R")
pr$run(host = "0.0.0.0", port = 8188, swagger = TRUE, debug = TRUE)