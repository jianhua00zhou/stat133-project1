# stat133
# Analysis of Sampson's Monks Social Network

## Part 4 Answer: 
**Observed Network**
- **Uneven Distribution:** The in-degree distribution is highly skewed.
- **Presence of Hubs:** Clear central figures exist, such as BONAVEN_5, who is significantly more popular than others.
- **Presence of Periphery:** There are also peripheral or nearly isolated figures with very low in-degrees (GREG_2).
- 
**Random Network**
- **Uniform Distribution:** The in-degree distribution is relatively uniform and centered around the mean.
- **Lack of Hubs:** There are no standout "stars"; popularity is evenly distributed.
- **Lack of Isolates:** Every node receives a similar number of connections.

**In what ways are the networks similar?**
The networks are similar in their basic properties: they have the same number of nodes(18 monks) and a similar overall density(total number of "likes"). This results in a nearly identical average in-degree across both networks.

**In what ways are they different?**
The primary difference lies in the structure of the degree distribution. The observed network has a skewed distribution characteristic of real-world social systems, with a few highly connected hubs. The random network has a uniform distribution, which is a direct result of a random connection process where every node has an equal probability of receiving a link.

**What patterns are missing from the random model?**
The random model lacks key patterns of real social structures, most notably preferential attachment and community structure. It cannot replicate the "rich get richer" phenomenon where popular individuals attract more connections, nor can it form the tightly-knit clusters or "cliques" that emerge organically in human societies.

---
## Part 1:
To understand the social dynamics, I first visualize the network. I am using the SAMPLK3 sociomatrix, which represents the "liking" relationships among the monks of the study.

**Static Network Plot**
The static plot reveals a non-uniform structure where certain monks (nodes) are more central and receive more connections (arrows pointing towards them) than others.
![Static Plot of Monks Network](https://github.com/jianhua00zhou/stat133-project1/blob/a55356e9b1edef2b3f6e3d3fe3ca7ad80c19e0c5/Rplot.png)

**Interactive Network Plot**
In this visualization, nodes can be moved, and hovering over them reveals their names and connections. The size of each node is proportional to its in-degree, making it easy to identify the most popular monks.
![Interactive Plot of Monks Network](https://github.com/jianhua00zhou/stat133-project1/blob/a55356e9b1edef2b3f6e3d3fe3ca7ad80c19e0c5/WechatIMG62702.jpg)

## Part 2:
Quantitative analysis helps to confirm the patterns observed in the visualizations. We computed three key summary measures for each monk: out-degree, in-degree, and mean tie strength.
The bar plot below visualizes the in-degree of each monk, clearly showing the disparity in popularity across the group.
![Observed Network In-Degree](https://github.com/jianhua00zhou/stat133-project1/blob/a55356e9b1edef2b3f6e3d3fe3ca7ad80c19e0c5/Rplot01.jpeg)

**Which monk is most liked?**
The most liked monk is Bonaven_5, who has the highest in-degree.

**Which monk is least liked?**
The least liked monk is Greg_2, who has the lowest in-degree.

## Part 3:
The function generate_random_network() creates a network of the same size where each monk gives out a fixed number of "likes" to randomly chosen peers.
![Random Network In-Degree](https://github.com/jianhua00zhou/stat133-project1/blob/a55356e9b1edef2b3f6e3d3fe3ca7ad80c19e0c5/Rplot02.jpeg)

## Part 4:
The structure of the real monks' network was compared against the randomly generated network. The most striking difference is in the in-degree distribution.
The observed network has a highly skewed distribution, with clear hubs (highly popular monks) and isolates (unpopular monks).
The random network's distribution is relatively uniform, with most monks having an in-degree value close to the average. There are no significant outliers.

**Short Reflection from Part 4**
By comparing the real Sampson's Monks network to a simple random model, the complexity of real-world social structures becomes evident. The observed network shows a highly uneven distribution of connections, creating a few highly popular "hubs" and several peripheral "isolates," whereas the random network's connections are distributed uniformly, lacking any such structural differentiation. This key difference demonstrates that social networks do not form by chance but are governed by underlying principles like "preferential attachment," where popularity is attractive. 
