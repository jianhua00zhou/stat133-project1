#load
library(lda)         
library(igraph)      
library(networkD3)  

data(sampson)

#part1
# Select the SAMPLK3 matrix from the sampson list
monk_mat <- sampson$SAMPLK3
# Get the monk's name, used as a label for the chart
monk_names <- rownames(monk_mat)

# Create an igraph graph object from the adjacency matrix
monk_graph_object = graph_from_adjacency_matrix(monk_mat, mode = "directed", diag = FALSE)
# mode = "directed" indicates a directed graph (A likes B, but that doesn't mean B likes A)

# Draw a static network diagram
plot(monk_graph_object,
     vertex.label = monk_names, #Label content
     vertex.label.cex = 0.5, #Label text size
     vertex.size = 10, #Node size
     vertex.label.dist = 1.3, #Push labels outwards away from nodes
     vertex.label.degree = -pi/2, #Labels are placed directly below the nodes
     edge.arrow.size = 0.3, #Arrow Size
     main = "Static Plot of Monks Network")

# Create a Nodes data frame
nodes <- data.frame(name = monk_names,
                    group = 1,
                    size = colSums(monk_mat))
# Create the Edges data frame
# First convert the matrix into a long format data frame
edges <- as.data.frame(as.table(monk_mat))
colnames(edges) <- c("source_name", "target_name", "value")
#Filter out rows with a value of 0 (indicating there is no "like" relationship between the two)
edges <- subset(edges, value > 0)
# Convert the monk's name to a numeric ID starting from 0
edges$source <- match(edges$source_name, monk_names) - 1
edges$target <- match(edges$target_name, monk_names) - 1
# Generate an interactive network diagram
forceNetwork(Links = edges, Nodes = nodes, Source = "source", Target = "target", Value = "value",
             NodeID = "name", Group = "group", Nodesize = "size", opacity = 0.9, zoom = TRUE, legend = TRUE,fontSize = 12)

#Part2
#1.Out-degree: The number of people each monk likes. Calculate the sum of each row of the matrix
out_degree <- rowSums(monk_mat)
#2.In-degree: The number of people who like each monk. Calculate the sum of each column of the matrix
in_degree <- colSums(monk_mat)
#3.Mean tie strength. In this data, relationships are either 1 (like) or 0 (dislike), so this value is the same as the out-degree.
mean_tie_strength <- out_degree
#4.Store all results in a list
result_list <- list(
  out_degree = out_degree,
  in_degree = in_degree,
  mean_tie_strength = mean_tie_strength)
#5.# Draw a barplot
barplot(in_degree,
        las = 2, # Display the x-axis label vertically
        main = "In-Degrees of Monks",
        ylab = "In-Degree")
#6.Find the monk with the highest indegree
most_liked_monk <- names(which.max(in_degree))
# Find the monk with the lowest indegree
least_liked_monk <- names(which.min(in_degree))

#part3
# Function to generate random networks
generate_random_network <- function(num_nodes, likes_per_node){
  # Create an empty matrix of num_nodes x num_nodes, filling it with all 0s
  random_matrix <- matrix(0, nrow = num_nodes, ncol = num_nodes)
  # Generate the "like" object for each node (monk)
  for (i in 1:num_nodes) {
    # A person cannot "like" himself, so he must exclude himself from the choice
    possible_targets <- setdiff(1:num_nodes, i)
    # Randomly select likes_per_node targets from possible targets
    chosen_targets <-sample(possible_targets, size = likes_per_node, replace = FALSE)
    # In the matrix, mark the selected relationship as 1
    random_matrix[i, chosen_targets] <- 1
  }
  return(random_matrix)
}

set.seed(123) # Set the random seed to ensure the same result each time run it
num_monks <- nrow(monk_mat)
avg_likes <- round(mean(out_degree)) # Calculate the average outdegree and round it up
random_monk_mat <- generate_random_network(num_nodes = num_monks, likes_per_node = avg_likes)

# Add a name to the random network for easy comparison
rownames(random_monk_mat) <- monk_names
colnames(random_monk_mat) <- monk_names

#part4
# Calculate the in-degree of a random network
random_in_degree <- colSums(random_monk_mat)

# Draw a bar plot for the in-degree of a random network
barplot(random_in_degree,
        las =2,
        main = "In-Degree of Random Network",
        ylab = "IN-Degree",
        )
        